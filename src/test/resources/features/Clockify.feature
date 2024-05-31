@TrabajoPractico8
Feature: Sample

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = MjRlZjVlNGQtYzNhYy00YWU3LTk0YjEtMzgwY2E3YzNjZjY3

  @AddWorkspace
  Scenario Outline: Agregar workspace
    Given base url https://api.clockify.me/api/
    And endpoint v1/workspaces
    And set value <nameWorkspace> of key name in body jsons/bodies/AddWorkspace.json
    When execute method POST
    Then the status code should be 201

    Examples:
      | nameWorkspace            |
      | basic automation academy 2|

  @GetWorkspace
  Scenario: Get workspace info by ID
    Given base url https://api.clockify.me/api
    And endpoint v1/workspaces/66171b3cb7d9b21738806151
    When execute method GET
    Then the status code should be 200

  @AddANewProject
  Scenario: Proyecto creado exitosamente
    Given base url https://api.clockify.me/api/
    And endpoint v1/workspaces/66171b3cb7d9b21738806151/projects
    And set value "Eliminar 4" of key name in body jsons/bodies/AddProject.json
    When execute method POST
    Then the status code should be 201

  @FindProjectById
  Scenario: Get project info by ID
    Given base url https://api.clockify.me/api
    And endpoint v1/workspaces/66171b3cb7d9b21738806151/projects/6659284c5ef4fd678d940466
    When execute method GET
    Then the status code should be 200

  @EditProject
  Scenario: Edit values from project
    Given base url https://api.clockify.me/api/
    And endpoint v1/workspaces/66171b3cb7d9b21738806151/projects/6659284c5ef4fd678d940466
    And set value true of key archived in body jsons/bodies/DeleteProject.json
    When execute method PUT
    Then the status code should be 200

  @DeleteProject
  Scenario: Delete project
    Given base url https://api.clockify.me/api/
    And endpoint v1/workspaces/66171b3cb7d9b21738806151/projects/6659284c5ef4fd678d940466
    When execute method DELETE
    Then the status code should be 200

  @EditProjectEstimate
  Scenario: Edit values from project
    Given base url https://api.clockify.me/api/
    And endpoint v1/workspaces/66171b3cb7d9b21738806151/projects/66592c7bca17ee4162521a44/estimate
    And set value 8 of key hourlyRate in body jsons/bodies/EditProjectEstimate.json
    When execute method PATCH
    Then the status code should be 200