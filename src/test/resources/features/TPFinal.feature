@TPFinal
Feature: Trabajo práctico final

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YzNlYTU2M2UtMzAxYS00ZjEwLWE3NzYtNjhlOGQ0ZGVmNjQ0

  @ConsultarHoras
  Scenario: Consultar horas registradas
    Given base url https://api.clockify.me/api/
    And endpoint v1/workspaces/66171a50d88e6d1420819a09/time-entries/666284982cba6f5957afa0f8
    When execute method GET
    Then the status code should be 200

  @AgregarHoras
  Scenario: Agregar horas a un proyecto
    Given body jsons/bodies/BodyTimeEntries.json
    Given base url https://api.clockify.me/api/
    And endpoint v1/workspaces/66171a50d88e6d1420819a09/time-entries/666284982cba6f5957afa0f8
    When execute method PUT
    Then the status code should be 200

  @EditarHora
  Scenario: Editar un campo de registro de hora
    Given body jsons/bodies/BodyTimeEntries.json
    Given base url https://api.clockify.me/api/
    And endpoint v1/workspaces/66171a50d88e6d1420819a09/time-entries/666284982cba6f5957afa0f8
    And set value "Cambio de nombre para el TP final" of key description in body jsons/bodies/BodyTimeEntries.json
    When execute method PUT
    Then the status code should be 200

  @EliminarHora
  Scenario: Eliminar registro de hora
    Given body jsons/bodies/BodyTimeEntries.json
    Given base url https://api.clockify.me/api/
    And endpoint v1/workspaces/66171a50d88e6d1420819a09/time-entries/666284982cba6f5957afa0f8
    When execute method DELETE
    Then the status code should be 204

