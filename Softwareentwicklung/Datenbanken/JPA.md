---
tags:
  - DB
aliases:
  - Jakarta Persistence API
created: 29. November 2022
---

# Jakarta Persistence API - JPA

(Java/Jakarta Persistence API)

Schnittstelle Objekte <-> Datenbank für Java-Anwendungen. JPA ist eine Spezialisierung von ODB (ODB ist eine allgemeine Konvention nicht nur für Java).

Mittels JPA wird eine Zwischenschicht zwischen der Java-Anwendung und der Datenbank angeboten um objektorientiert mit Tabellen arbeiten zu können.

## Beispiel Anhand Uni-Datenbank:

1. Programm-Setup am Besten mit Maven, die Projektkonfiguration pom.xml:
   
   ```xml
   <?xml version="1.0" encoding="UTF-8"?>
   <project xmlns="http://maven.apache.org/POM/4.0.0"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
       <modelVersion>4.0.0</modelVersion>
   
       <groupId>org.example</groupId>
       <artifactId>JpaIntro</artifactId>
       <version>1.0-SNAPSHOT</version>
   
       <properties>
           <maven.compiler.source>18</maven.compiler.source>
           <maven.compiler.target>18</maven.compiler.target>
           <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
       </properties>
   
       <dependencies>
           <!-- https://mvnrepository.com/artifact/org.hibernate/hibernate-entitymanager -->
           <dependency>
               <groupId>org.hibernate</groupId>
               <artifactId>hibernate-core</artifactId>
               <version>6.1.5.Final</version>
           </dependency>
           <!-- https://mvnrepository.com/artifact/mysql/mysql-connector-java -->
           <dependency>
               <groupId>mysql</groupId>
               <artifactId>mysql-connector-java</artifactId>
               <version>8.0.31</version>
           </dependency>
   
       </dependencies>
   
   </project>
   ```
   
   Eingefügt werden hier die beiden Abhängigkeiten `hibernate` (zum DB unabhängigen arbeiten) und `mysql` für den Zugriff auf eine MySQL/MariaDB. Die Konfiguration kann aus dem Mavenrepositories gefunden werden: <https://mvnrepository.com/>

2. Im Hauptprogramm wird mit den Klassen/Entitäten gearbeitet:
   
   ```java
   public class Main {
       public static void main(String[] args) {
           EntityManagerFactory emf = Persistence.createEntityManagerFactory("my-pu");
           EntityManager em = emf.createEntityManager();
   
           Prof p1 = em.find(Prof.class, 2126);
           System.out.println(p1);
   
           Ass a1 = em.find(Ass.class, 3003);
           System.out.println(a1);
       }
   }
   ```
   
   `my-pu` referenziert auf die DB mittels Persistence-Konfiguration (siehe Unten persistence.xml).
   
   - Wie ersichtlich kann mittels `find` in der Datenbank ein Eintrag gesucht werden (Query).
   
   - Einlesen sämtlicher Profs:
     
     ```java
     List<Prof> profList = em.createQuery("SELECT e FROM Prof e").getResultList();
     ```
     
     Die `SELECT`-Anweisung ist hier in JPQL, einer Sprache ähnlich zu SQL geschrieben.
   
   - Zum Ändern von Daten (z.B. INSERT) muss eine Transaction gestartet und final commited werden. Das Schreiben passiert mit `persist`:
     
     ```java
     Prof p2 = new Prof();
     p2.setId(2999);
     p2.setName("Klaus");
     p2.setDob(LocalDate.of(1999,9,19));
     p2.setDegree("c9");
     p2.setRoom("A214");
     
     em.getTransaction().begin();
     em.persist(p2);
     em.getTransaction().commit();
     ```

3. Entitäten
   
   Mittels Klassen/Entitäten werden die DB-Tabellen abgebildet:
   
   ```java
   @Entity    // <- Pflicht
   @Table(name = "Ass")   // <- Optionale Settings
   public class Ass {
       @Id   // <- PrimKey / Pflicht
       @Column(name = "id", nullable = false)   // <- zusätzliche Settings
       private Integer id;
       private String name;
       private LocalDate dob;
       private String expertise;
       private int profid;
   
       public Integer getId() {
           return id;
       }
       public void setId(Integer id) {
           this.id = id;
       }
   
   //... alle Getter/Setter, toString, CTOR ...
   }
   ```
   
   auf diese Art wird eine Tabelle ohne Fremdschlüsselbeziehung abgebildet. Soll in diesem Beispiel der Assistent mit dem übergeordneten Professor verknüpft werden:
   
   ```java
   @ManyToOne(cascade = CascadeType.REFRESH)
   @JoinColumn(name = "profid", referencedColumnName = "id")
   private Prof prof;
   ```
   
   hier wird die `profid` mit der `id` des Profs verknüpft. Diese Verknüpfung ist Unidirektional, in der Prof-Tabelle ist der zugeordnete Assistent nicht bekannt. Für Bidirektionale Verknüpfungen muss ein entsprechendes Tag in beiden Tabellen eingebaut werden (@OneToOne …).

4. Persistence
   
   Die Verknüpfung DB<->Code erfolgt mittels `…/src/main/resources/META-INF/persistence.xml`:

```xml
<?xml version="1.0" encoding="UTF-8" ?>

<persistence version="2.1"
   xmlns="http://xmlns.jcp.org/xml/ns/persistence"
   xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
   xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence
   http://xmlns.jcp.org/xml/ns/persistence/persistence_2_2.xsd">
   <persistence-unit name="my-pu" transaction-type="RESOURCE_LOCAL">
       <properties>
           <property name="javax.persistence.jdbc.driver" value="com.mysql.jdbc.Driver"/>
           <property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/5ahel_uni"/>
           <property name="javax.persistence.jdbc.user" value="root"/>
           <property name="javax.persistence.jdbc.password" value=""/>
           <property name="hibernate.dialect" value="org.hibernate.dialect.MySQL8Dialect"></property>
           <property name="hibernate.show_sql" value="true"></property>
           <property name="hibernate.format_sql" value="true"></property>
           <property name="hibernate.hbm2ddl.auto" value="update"></property>
       </properties>
   </persistence-unit>
</persistence>
```

   Achtung: Tippfehler im XML führen zu schwer interpretierbaren Fehlermeldungen. Der Name `my-pu` wird im main verwendet um auf die DB zuzugreifen.

# Referenz

- Oracle-Einführung: [Introduction to the Java Persistence API - The Java EE 6 Tutorial](https://docs.oracle.com/javaee/6/tutorial/doc/bnbpz.html)

- Youtube-Video dazu mit Eclipse: [What is JPA? | JPA Implimentation - YouTube]( [- YouTube](https://www.youtube.com/watch?v=otinf)
