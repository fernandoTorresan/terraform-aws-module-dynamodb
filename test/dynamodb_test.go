package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/dynamodb"
	"github.com/aws/aws-sdk-go/service/dynamodb/dynamodbattribute"

	"github.com/gruntwork-io/terratest/modules/terraform"

	"github.com/aws/aws-sdk-go/aws/session"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"

	"github.com/stretchr/testify/assert"
)

type People struct {
	PersonID string `json:"PersonID"`
	Name     string `json:"name"`
	Age      int    `json:"age"`
}

var awsRegion = os.Getenv("AWS_DEFAULT_REGION")

const (
	tableName  = "People"
	hashKey    = "PersonID"
	PeopleName = "Joseph"

	workingDir = "../examples/dynamodb/"
)

func TestDynamodbCreation(t *testing.T) {
	t.Parallel()

	defer test_structure.RunTestStage(t, "cleanup_terraform", func() {
		undeployUsingTerraform(t)
	})

	test_structure.RunTestStage(t, "deploy_terraform", func() {
		deployUsingTerraform(t)
	})

	test_structure.RunTestStage(t, "validate", func() {
		validateDynamodbInsertAndReadItem(t)
	})
}

func validateDynamodbInsertAndReadItem(t *testing.T) {

	sess, err := session.NewSession(&aws.Config{
		Region: aws.String(awsRegion),
	})

	if err != nil {
		fmt.Println("Got error to create new session")
		fmt.Println(err.Error())
		os.Exit(1)
	}

	svc := dynamodb.New(sess)

	insertItem(svc)
	nomeRetornado := readItem(svc)

	assert.Equal(t, nomeRetornado, PeopleName, "O nome da pessoa lido da tabela deveria ser o mesmo.")
}

func insertItem(svc *dynamodb.DynamoDB) {

	people := People{
		PersonID: "1",
		Name:     PeopleName,
		Age:      20,
	}

	av, err := dynamodbattribute.MarshalMap(people)

	if err != nil {
		fmt.Println("Got error marshalling map:")
		fmt.Println(err.Error())
		os.Exit(1)
	}

	input := &dynamodb.PutItemInput{
		Item:      av,
		TableName: aws.String(tableName),
	}

	_, err = svc.PutItem(input)

	if err != nil {
		fmt.Println(err.Error())
		return
	}
}

func readItem(svc *dynamodb.DynamoDB) string {

	type PeopleKey struct {
		PersonID string `json:"PersonID"`
	}

	peopleKey := PeopleKey{
		PersonID: "1",
	}

	key, err := dynamodbattribute.MarshalMap(peopleKey)
	if err != nil {
		fmt.Println(err.Error())
	}

	input := &dynamodb.GetItemInput{
		Key:       key,
		TableName: aws.String(tableName),
	}

	result, err := svc.GetItem(input)
	if err != nil {
		fmt.Println(err.Error())
	}

	peopleOne := People{}
	errore := dynamodbattribute.UnmarshalMap(result.Item, &peopleOne)
	if errore != nil {
		fmt.Println(err.Error())
	}

	return peopleOne.Name
}

func deployUsingTerraform(t *testing.T) {

	terraformOptions := &terraform.Options{

		TerraformDir: workingDir,

		Vars: map[string]interface{}{
			"environment": "staging",
			"table_name":  tableName,
			"hash_key":    hashKey,
		},
	}

	test_structure.SaveTerraformOptions(t, workingDir, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
}

func undeployUsingTerraform(t *testing.T) {

	terraformOptions := test_structure.LoadTerraformOptions(t, workingDir)

	terraform.Destroy(t, terraformOptions)
}
