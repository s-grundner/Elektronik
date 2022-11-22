# 6.7 Spring-PostgreSQL

Spring: Web-Framework für Java.

Beispiel: Entwicklung eines REST-API für den Zugriff auf eine PostgreSQL-Datenbank-Tabelle `employee` (Datenbank `employeedb`) zur Verwaltung von Mitarbeitern.

Es werden die folgenden 5 Routes/Befehle unterstützt:

- `GET`: `/employee` sämtliche Mitarbeiter anzeigen
- `GET`: `/employee/1` Mitarbeiter mit `id=1` anzeigen
- `POST`: `/employee`: `{"name":"Hans",...}` Einfügen Mitarbeiter mit den Daten im HTTP-Body
- `PUT`: `/employee`: `{"id":"3",name":"Hans",...}` Ändern der Daten von Benutzer mit `id=3`
- `DELETE`: `/employee/4` Löschen des Mitarbeiters mit `id=4`

In den folgenden 7 Schritten wird die Anwendung entwickelt:

### 1. Spring-Projekt Erstellen

- [start.spring.io](), Projekt konfigurieren mit Gradle oder Maven, Java
  (für Unten: com.developer/employeemanagement)

- Dependencies: Spring-Web, Spring-Data-JPA, PostgreSQL-Driver

- Generate, Download, Entpacken und mit IntelliJ Öffnen

### 2. Erstellen und Verbinden mit Datenbank

- Installation von PostgreSQL, Anlegen eines Benutzers (bei der Installation wird für User postgres nach dem Passwort gefragt).

- Mittels DBMS (bei Installation dabei: *pgAdmin*) erzeugen einer Datenbank `employeedb`. Die Tabelle wird aus der Anwendung erzeugt.

- Zugang auf die Datenbank aus der Anwendung: employee-management->src->main->resources->application.properties:
  
  ```
  ##connect to database
  spring.datasource.driver-class-name=org.postgresql.Driver
  spring.datasource.url=jdbc:postgresql://localhost:5432/employeedb
  spring.datasource.username=postgres
  spring.datasource.password=comein
  ```
  
  Starten der Anwendung, es darf keine Fehlermeldung kommen. Die Zugangsdaten müssen korrekt sein (Port, Benutzer, Passwort) und die DB muss laufen (Dienste...).
  
  Der Standardport von Spring ist 8080, wenn ein anderer Port gewünscht ist kann der in den `application.properties` mit dieser Zeile angepasst werden:
  
  ```
  server.port=8081
  ```

### 3. Erstellen Entity

- Entity Package und Klasse erstellen: employee-management->src->main->java->com.developer.employeemanagement->entity->EmployeeEntity.java:
  
  ```java
  package com.developer.employeemanagement.entity;
  
  import javax.persistence.*;
  import java.util.Date;
  
  @Entity
  @Table(name = "mt_employee")
  public class EmployeeEntity {
      @Id
      @GeneratedValue(strategy = GenerationType.IDENTITY)
      @Column(name="emp_id")
      private Long id;
      @Column(name="name")
      private String name;
      @Column(name="gender")
      private String gender;
      @Column(name="date_of_birth")
      private Date dateOfBirth;
      @Column(name="address")
      private String address;
      public EmployeeEntity() {}
      public EmployeeEntity(Long id, String name, String gender, Date dateOfBirth, String address) {
          this.id = id;
          this.name = name;
          this.gender = gender;
          this.dateOfBirth = dateOfBirth;
          this.address = address;
      }
      public Long getId() { return id; }
      public void setId(Long id) { this.id = id; }
      public String getGender() { return gender; }
      public void setGender(String gender) { this.gender = gender; }
      public String getName() { return name; }
      public void setName(String name) { this.name = name; }
      public Date getDateOfBirth() { return dateOfBirth; }
      public void setDateOfBirth(Date dateOfBirth) { this.dateOfBirth = dateOfBirth; }
      public String getAddress() { return address; }
      public void setAddress(String address) { this.address = address; }
  }
  ```

- JPA Einstellungen um automatisch die Tabelle zu erzeugen, wenn sie nicht schon existiert: employee-management->src->main->resources->application.properties:
  
  ```
  ##JPA Config
  spring.jpa.properties..hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
  spring.jpa.hibernate.ddl-auto=update
  spring.jpa.show-sql=true
  spring.jpa.properties.hibernate.format_sql=true
  ```
  
  Testen der Konfiguration durch Ausführen des Hauptprogramms (es darf kein Fehler kommen und es wird automatisch die employeedb-Tabelle erzeugt).

### 4. Erstellen Repository

- Erstellen des Packages und der Klasse Repository: employee-management->src->main->java->com.developer.employeemanagement->repository->EmployeeRepository:
  
  ```java
  package com.developer.employeemanagement.repository;
  
  import com.developer.employeemanagement.entity.EmployeeEntity;
  import org.springframework.data.jpa.repository.JpaRepository;
  import org.springframework.stereotype.Repository;
  
  @Repository
  public interface EmployeeRepository extends JpaRepository<EmployeeEntity, Long> {
  }
  ```
  
  Typen von JpaRepository sind Klasse (EmployeeEntity) und der Schlüssel (id -> Long).

### 5. Erstellen Service

- Service Package und Klasse erstellen: employee-management->src->main->java->com.developer.employeemanagement->service->EmployeeService.java:
  
  ```java
  package com.developer.employeemanagement.service;
  
  import com.developer.employeemanagement.entity.EmployeeEntity;
  import java.util.List;
  import java.util.Optional;
  
  public interface EmployeeService {
      List<EmployeeEntity> findAllEmployee();
      Optional<EmployeeEntity> findById(Long id);
      EmployeeEntity saveEmployee(EmployeeEntity employeeEntity);
      EmployeeEntity updateEmployee(EmployeeEntity employeeEntity);
      void deleteEmployee(Long id);
  }
  ```

- Implementierung der Service employee-management->src->main->java->com.developer.employeemanagement->service->impl->EmployeeServiceImpl.java:
  
  ```java
  package com.developer.employeemanagement.service.impl;
  
  import com.developer.employeemanagement.entity.EmployeeEntity;
  import com.developer.employeemanagement.repository.EmployeeRepository;
  import com.developer.employeemanagement.service.EmployeeService;
  import org.springframework.stereotype.Service;
  
  import java.util.List;
  import java.util.Optional;
  
  @Service
  public class EmployeeServiceImpl implements EmployeeService {
      private final EmployeeRepository employeeRepository;
      public EmployeeServiceImpl(EmployeeRepository employeeRepository) {
          this.employeeRepository = employeeRepository; }
      @Override public List<EmployeeEntity> findAllEmployee() {
          return employeeRepository.findAll(); }
      @Override public Optional<EmployeeEntity> findById(Long id) {
          return employeeRepository.findById(id); }
      @Override public EmployeeEntity saveEmployee(EmployeeEntity employeeEntity) {
          return employeeRepository.save(employeeEntity); }
      @Override public EmployeeEntity updateEmployee(EmployeeEntity employeeEntity) {
          return employeeRepository.save(employeeEntity); }
      @Override public void deleteEmployee(Long id) {
          employeeRepository.deleteById(id); }
  }
  ```

### 6. Erstellen Controller

- Erstellen Controller Package und Klasse: employee-management->src->main->com.developer.employeemanagement->controller->EmployeeController.java:
  
  ```java
  package com.developer.employeemanagement.controller;
  
  import com.developer.employeemanagement.entity.EmployeeEntity;
  import com.developer.employeemanagement.service.EmployeeService;
  import org.springframework.web.bind.annotation.*;
  
  import java.util.List;
  import java.util.Optional;
  
  @RestController
  @RequestMapping("/employee")
  public class EmployeeController {
      private final EmployeeService employeeService;
  
      public EmployeeController(EmployeeService employeeService) {
          this.employeeService = employeeService;
      }
      @GetMapping
      public List<EmployeeEntity> findAllEmployee() {
          return employeeService.findAllEmployee();
      }
      @GetMapping("/{id}")
      public Optional<EmployeeEntity> findEmployeeById(@PathVariable("id") Long id) {
          return employeeService.findById(id);
      }
      @PostMapping
      public EmployeeEntity saveEmployee(@RequestBody EmployeeEntity employeeEntity) {
          return employeeService.saveEmployee(employeeEntity);
      }
      @PutMapping
      public EmployeeEntity updateEmployee(@RequestBody EmployeeEntity employeeEntity) {
          return employeeService.updateEmployee(employeeEntity);
      }
      @DeleteMapping("/{id}")
      public void deleteEmployee(@PathVariable("id") Long id) {
          employeeService.deleteEmployee(id);
      }
  }
  ```

### 7. Test

Mittels VSCode->ThunderClient -> localhost:8080/employee
