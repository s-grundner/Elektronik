# 6.8 Spring-PostgreSQL

Spring: Web-Framework für Java.

Beispiel: Entwicklung eines REST-API für den Zugriff auf eine PostgreSQL-Datenbank-Tabelle `student` (Datenbank `studentdb`) zur Verwaltung von Studenten.

Es werden die folgenden 5 Routes/Befehle unterstützt:

- `GET`: `/student` sämtliche Studenten anzeigen
- `GET`: `/student/1` Studenten mit `id=1` anzeigen
- `POST`: `/student`: `{"name":"Hans",…}` Einfügen Studenten mit den Daten im HTTP-Body
- `PUT`: `/student`: `{"id":"3",name":"Hans",…}` Ändern der Daten von Benutzer mit `id=3`
- `DELETE`: `/student/4` Löschen des Studenten mit `id=4`

In den folgenden 7 Schritten wird die Anwendung entwickelt:

## 1. Spring-Projekt Erstellen

- [start.spring.io](), Projekt konfigurieren mit Gradle oder Maven, Java  
  (für Unten: com.developer/studentmanagement)

- Dependencies: Spring-Web, Spring-Data-JPA, PostgreSQL-Driver

- Generate, Download, Entpacken und mit IntelliJ Öffnen

## 2. Erstellen und Verbinden mit Datenbank

- Installation von PostgreSQL, Anlegen eines Benutzers (bei der Installation wird für User postgres nach dem Passwort gefragt).

- Mittels DBMS (bei Installation dabei: *pgAdmin*) erzeugen einer Datenbank `studentdb`. Die Tabelle wird aus der Anwendung erzeugt.

- Zugang auf die Datenbank aus der Anwendung: studentmanagement->src->main->resources->application.properties:
  
  ```
  ##connect to database
  spring.datasource.driver-class-name=org.postgresql.Driver
  spring.datasource.url=jdbc:postgresql://localhost:5432/studentdb
  spring.datasource.username=postgres
  spring.datasource.password=comein
  ```
  
  Starten der Anwendung, es darf keine Fehlermeldung kommen. Die Zugangsdaten müssen korrekt sein (Port, Benutzer, Passwort) und die DB muss laufen (Dienste…).
  
  Der Standardport von Spring ist 8080, wenn ein anderer Port gewünscht ist kann der in den `application.properties` mit dieser Zeile angepasst werden:
  
  ```
  server.port=8081
  ```

## 3. Erstellen Entity

- Entity Package und Klasse erstellen: studentmanagement->src->main->java->com.developer.studentmanagement->entity->StudentEntity.java:
  
  ```java
  package com.developer.studentmanagement.entity;
  
  import javax.persistence.*;
  import java.util.Date;
  
  @Entity
  @Table(name = "mt_student")
  public class StudentEntity {
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
      public StudentEntity() {}
      public StudentEntity(Long id, String name, String gender, Date dateOfBirth, String address) {
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

- JPA Einstellungen um automatisch die Tabelle zu erzeugen, wenn sie nicht schon existiert: studentmanagement->src->main->resources->application.properties:
  
  ```
  ##JPA Config
  spring.jpa.properties..hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
  spring.jpa.hibernate.ddl-auto=update
  spring.jpa.show-sql=true
  spring.jpa.properties.hibernate.format_sql=true
  ```
  
  Testen der Konfiguration durch Ausführen des Hauptprogramms (es darf kein Fehler kommen und es wird automatisch die studentdb-Tabelle erzeugt).

## 4. Erstellen Repository

- Erstellen des Packages und der Klasse Repository: studentmanagement->src->main->java->com.developer.studentmanagement->repository->StudentRepository:
  
  ```java
  package com.developer.studentmanagement.repository;
  
  import com.developer.studentmanagement.entity.StudentEntity;
  import org.springframework.data.jpa.repository.JpaRepository;
  import org.springframework.stereotype.Repository;
  
  @Repository
  public interface StudentRepository extends JpaRepository<StudentEntity, Long> {
  }
  ```
  
  Typen von JpaRepository sind Klasse (StudentEntity) und der Schlüssel (id -> Long).

## 5. Erstellen Service

- Service Package und Klasse erstellen: studentmanagement->src->main->java->com.developer.studentmanagement->service->StudentService.java:
  
  ```java
  package com.developer.studentmanagement.service;
  
  import com.developer.studentmanagement.entity.StudentEntity;
  import java.util.List;
  import java.util.Optional;
  
  public interface StudentService {
      List<StudentEntity> findAllStudent();
      Optional<StudentEntity> findById(Long id);
      StudentEntity saveStudent(StudentEntity studentEntity);
      StudentEntity updateStudent(StudentEntity studentEntity);
      void deleteStudent(Long id);
  }
  ```

- Implementierung der Service studentmanagement->src->main->java->com.developer.studentmanagement->service->impl->StudentServiceImpl.java:
  
  ```java
  package com.developer.studentmanagement.service.impl;
  
  import com.developer.studentmanagement.entity.StudentEntity;
  import com.developer.studentmanagement.repository.StudentRepository;
  import com.developer.studentmanagement.service.StudentService;
  import org.springframework.stereotype.Service;
  
  import java.util.List;
  import java.util.Optional;
  
  @Service
  public class StudentServiceImpl implements StudentService {
      private final StudentRepository studentRepository;
      public StudentServiceImpl(StudentRepository studentRepository) {
          this.studentRepository = studentRepository; }
      @Override public List<StudentEntity> findAllStudent() {
          return studentRepository.findAll(); }
      @Override public Optional<StudentEntity> findById(Long id) {
          return studentRepository.findById(id); }
      @Override public StudentEntity saveStudent(StudentEntity studentEntity) {
          return studentRepository.save(studentEntity); }
      @Override public StudentEntity updateStudent(StudentEntity studentEntity) {
          return studentRepository.save(studentEntity); }
      @Override public void deleteStudent(Long id) {
          studentRepository.deleteById(id); }
  }
  ```

## 6. Erstellen Controller

- Erstellen Controller Package und Klasse: studentmanagement->src->main->com.developer.studentmanagement->controller->StudentController.java:
  
  ```java
  package com.developer.studentmanagement.controller;
  
  import com.developer.studentmanagement.entity.StudentEntity;
  import com.developer.studentmanagement.service.StudentService;
  import org.springframework.web.bind.annotation.*;
  
  import java.util.List;
  import java.util.Optional;
  
  @RestController
  @RequestMapping("/student")
  public class StudentController {
      private final StudentService studentService;
  
      public StudentController(StudentService studentService) {
          this.studentService = studentService;
      }
      @GetMapping
      public List<StudentEntity> findAllStudent() {
          return studentService.findAllStudent();
      }
      @GetMapping("/{id}")
      public Optional<StudentEntity> findStudentById(@PathVariable("id") Long id) {
          return studentService.findById(id);
      }
      @PostMapping
      public StudentEntity saveStudent(@RequestBody StudentEntity studentEntity) {
          return studentService.saveStudent(studentEntity);
      }
      @PutMapping
      public StudentEntity updateStudent(@RequestBody StudentEntity studentEntity) {
          return studentService.updateStudent(studentEntity);
      }
      @DeleteMapping("/{id}")
      public void deleteStudent(@PathVariable("id") Long id) {
          studentService.deleteStudent(id);
      }
  }
  ```

## 7. Test

Mittels VSCode->ThunderClient -> localhost:8080/student
