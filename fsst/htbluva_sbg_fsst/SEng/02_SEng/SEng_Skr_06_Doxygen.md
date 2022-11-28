# 6 Doxygen

Mit Doxygen kann direkt aus dem Code eine Dokumentation generiert werden. Vorteil: keine eigenen Dokumente, die eventuell in der Version nicht zusammenpassen ... Außerdem ist die Motivation größer, wenn direkt im Code mit kommentiert wird.

Youtube:   https://www.youtube.com/watch?v=mgVgZjaeNkw 

## Installation / Konfiguration

- Doxygen ist in vielen IDEs schon integriert. Hier wird eine Standalone-Möglichkeit erläutert.
  http://www.doxygen.nl/download.html
  Pfad eintragen in `PATH`

- https://graphviz.gitlab.io/_pages/Download/windows/graphviz-2.38.zip	(Tool zum Erstellen der UML-Diagramme)
  Pfad eintragen in `PATH`
- VSCode
  Doxygen-Plugin Schlosser
  Datei->Einstellungen->Erweiterungen -> Name, Datum, Mail ...

- Sourcen in einen eigenen Ordner Legen und dokumentieren (`\**`...)

- Doxygen mit doxyfile von Unten aus der Kommandozeile Starten (im Verzeichnis in welchem doxyfile liegt):

  ```
  doxygen
  ```

  Alternativ: Doxywizard und Einstellungen setzen

- *Step 1*: Pfad für das Arbeitsverzeichnis eingeben (Ablage Doxygen-Konfig ...)

Die Erstellung sollte nun durchlaufen. Wenn Fehler auftreten werden diese angeführt. Mittels \<Show HTML output\> kann das erstellte HTML direkt geöffnet werden.

- LaTex-Doku: `make.bat` ausführen - dazu muss ein LaTex (MikTex ...) installiert sein.

## Dokumentieren

Um direkt aus dem Code eine Dokumentation erstellen zu können, können spezielle Kommentare eingefügt werden:

```c++
/// Dreifache Slashes

/** Doppelte Sterne für einen Kommentarblock

Schlüsselworte für Doxygen:
/** 
 * @SCHLÜSSELWORT BESCHREIBUNG 
 */ 
```

als Schlüsselworte kann angegeben werden:

```c++
@brief       - kurze Beschreibung des folgenden Codes
@param abc   - Beschreibung des Parameters abc einer Funktion
@return      - Beschreibung des Rückgabewertes einer Funktion
@class abc   - Beschreibung der Klasse abc
@file abc.de - Beschreibung der Datei abc.de
```

Beispiel:

```java
/** 
* @file Beispiel.java 
* 
* @brief Eine kurze Beschreibung der Datei - was enthält sie, wozu ist sie da, ... 
* 
**/ 

/** 
* @class Beispiel 
* 
* @brief Eine kurze Beschreibung der Klasse 
* 
* Eine detailliertere Beschreibung der Klasse 
*/
class Beispiel { 
/** 
* @brief Ausgabe von "Hello World!" 
* 
* In der Kommandozeile wird "Hello World!" ausgegeben. Abschlieszend wird
* ein Zeilenumbruch mitgegeben.
*/ 
  public static void main(String[] args) { 
    System.out.println("Hello World!"); 
  } 
}
```

## Hauptseite

Die Projekt-Startseite kann unabhängig vom Code designt werden.

In einer Datei:

```java
/** 
* @mainpage Beispielprogramm 
* 
* Beschreibung des Projekts 
* <br>Mit "<br>" kann bei der HTML-Dokumentation eine neue Zeile erzeugt werden 
* 
* Mit dem <img-Schlüsselwort können eigene Bilder hinzugefügt werden 
* <img src="../application_screenshot.jpg" alt="Screenshot"> 
* 
* @author Max Mustermann 
*/ 
```

Grundsätzlich können in der Dokumentation HTML-Elemente eingefügt werden.

## Dateibeschreibung

Am Beginn einer Datei:

```java
/**
* @file Beispiel.java 
* @brief Eine kurze Beschreibung der Datei - was enthält sie, wozu ist sie da, ... 
*
* die laaaaaaannggggeeeee Beschreibung 
* der Datei ...
**/
```

## Klassenbeschreibung

Direkt vor der Klasse:

```java
/** 
* @class Beispiel 
* 
* @brief Eine kurze Beschreibung der Klasse. Kann
*        mehrzeilig sein, Einrueckungen werden ignoriert.
*        Diese Beschreibung kommt in die Kurzbschreibung.
* 
* Eine detailliertere Beschreibung der Klasse 
*/
class Beispiel {
```

Das Schlüsselwort @class bewirkt, dass der Kommentar auch woanders (als direkt vor der Klasse) gesetzt werden darf. Damit wird dieser Kommentar auf alle Fälle der Klasse Beispiel zugeordnet.

## Funktionsbeschreibung

Direkt vor der Funktion:

```java
/** 
* @brief Funktion zur Berechnung Steigratenfaktor.
* @param boing Stingkarto-Wert in mm/MPa
* @return Steigratenfaktor
* Eine detailliertere Beschreibung der Klasse kann 
* hier aufgefuehrt werden
*/
    int tschdi(Boing *boing) override;
```





Es gibt eine sehr große, weitere Vielzahl an Parametern die angeführt werden können.

Beispiel doxyfile (Pfade anpassen:

```
DOXYFILE_ENCODING      = UTF-8
PROJECT_NAME           = DoxyDemo
PROJECT_NUMBER         = 1.0
PROJECT_BRIEF          =
PROJECT_LOGO           =
OUTPUT_DIRECTORY       = C:\ws\01_Doku\doc
CREATE_SUBDIRS         = NO
ALLOW_UNICODE_NAMES    = NO
OUTPUT_LANGUAGE        = German
BRIEF_MEMBER_DESC      = YES
REPEAT_BRIEF           = YES
ABBREVIATE_BRIEF       = "The $name class" \
                         "The $name widget" \
                         "The $name file" \
                         is \
                         provides \
                         specifies \
                         contains \
                         represents \
                         a \
                         an \
                         the
ALWAYS_DETAILED_SEC    = NO
INLINE_INHERITED_MEMB  = NO
FULL_PATH_NAMES        = YES
STRIP_FROM_PATH        =
STRIP_FROM_INC_PATH    =
SHORT_NAMES            = NO
JAVADOC_AUTOBRIEF      = NO
JAVADOC_BANNER         = NO
QT_AUTOBRIEF           = NO
MULTILINE_CPP_IS_BRIEF = NO
PYTHON_DOCSTRING       = YES
INHERIT_DOCS           = YES
SEPARATE_MEMBER_PAGES  = NO
TAB_SIZE               = 4
ALIASES                =
OPTIMIZE_OUTPUT_FOR_C  = NO
OPTIMIZE_OUTPUT_JAVA   = NO
OPTIMIZE_FOR_FORTRAN   = NO
OPTIMIZE_OUTPUT_VHDL   = NO
OPTIMIZE_OUTPUT_SLICE  = NO
EXTENSION_MAPPING      =
MARKDOWN_SUPPORT       = YES
TOC_INCLUDE_HEADINGS   = 5
AUTOLINK_SUPPORT       = YES
BUILTIN_STL_SUPPORT    = NO
CPP_CLI_SUPPORT        = NO
SIP_SUPPORT            = NO
IDL_PROPERTY_SUPPORT   = YES
DISTRIBUTE_GROUP_DOC   = NO
GROUP_NESTED_COMPOUNDS = NO
SUBGROUPING            = YES
INLINE_GROUPED_CLASSES = NO
INLINE_SIMPLE_STRUCTS  = NO
TYPEDEF_HIDES_STRUCT   = NO
LOOKUP_CACHE_SIZE      = 0
NUM_PROC_THREADS       = 1
EXTRACT_ALL            = YES
EXTRACT_PRIVATE        = NO
EXTRACT_PRIV_VIRTUAL   = NO
EXTRACT_PACKAGE        = NO
EXTRACT_STATIC         = NO
EXTRACT_LOCAL_CLASSES  = YES
EXTRACT_LOCAL_METHODS  = NO
EXTRACT_ANON_NSPACES   = NO
RESOLVE_UNNAMED_PARAMS = YES
HIDE_UNDOC_MEMBERS     = NO
HIDE_UNDOC_CLASSES     = NO
HIDE_FRIEND_COMPOUNDS  = NO
HIDE_IN_BODY_DOCS      = NO
INTERNAL_DOCS          = NO
CASE_SENSE_NAMES       = NO
HIDE_SCOPE_NAMES       = NO
HIDE_COMPOUND_REFERENCE= NO
SHOW_HEADERFILE        = YES
SHOW_INCLUDE_FILES     = YES
SHOW_GROUPED_MEMB_INC  = NO
FORCE_LOCAL_INCLUDES   = NO
INLINE_INFO            = YES
SORT_MEMBER_DOCS       = YES
SORT_BRIEF_DOCS        = NO
SORT_MEMBERS_CTORS_1ST = NO
SORT_GROUP_NAMES       = NO
SORT_BY_SCOPE_NAME     = NO
STRICT_PROTO_MATCHING  = NO
GENERATE_TODOLIST      = YES
GENERATE_TESTLIST      = YES
GENERATE_BUGLIST       = YES
GENERATE_DEPRECATEDLIST= YES
ENABLED_SECTIONS       =
MAX_INITIALIZER_LINES  = 30
SHOW_USED_FILES        = YES
SHOW_FILES             = YES
SHOW_NAMESPACES        = YES
FILE_VERSION_FILTER    =
LAYOUT_FILE            =
CITE_BIB_FILES         =
QUIET                  = NO
WARNINGS               = YES
WARN_IF_UNDOCUMENTED   = YES
WARN_IF_DOC_ERROR      = YES
WARN_IF_INCOMPLETE_DOC = YES
WARN_NO_PARAMDOC       = NO
WARN_AS_ERROR          = NO
WARN_FORMAT            = "$file:$line: $text"
WARN_LOGFILE           =
INPUT                  = C:\ws\01_Doku\src
INPUT_ENCODING         = UTF-8
FILE_PATTERNS          = *.c \
                         *.cc \
                         *.cxx \
                         *.cpp \
                         *.c++ \
                         *.java \
                         *.ii \
                         *.ixx \
                         *.ipp \
                         *.i++ \
                         *.inl \
                         *.idl \
                         *.ddl \
                         *.odl \
                         *.h \
                         *.hh \
                         *.hxx \
                         *.hpp \
                         *.h++ \
                         *.l \
                         *.cs \
                         *.d \
                         *.php \
                         *.php4 \
                         *.php5 \
                         *.phtml \
                         *.inc \
                         *.m \
                         *.markdown \
                         *.md \
                         *.mm \
                         *.dox \
                         *.py \
                         *.pyw \
                         *.f90 \
                         *.f95 \
                         *.f03 \
                         *.f08 \
                         *.f18 \
                         *.f \
                         *.for \
                         *.vhd \
                         *.vhdl \
                         *.ucf \
                         *.qsf \
                         *.ice
RECURSIVE              = YES
EXCLUDE                =
EXCLUDE_SYMLINKS       = NO
EXCLUDE_PATTERNS       =
EXCLUDE_SYMBOLS        =
EXAMPLE_PATH           =
EXAMPLE_PATTERNS       = *
EXAMPLE_RECURSIVE      = NO
IMAGE_PATH             =
INPUT_FILTER           =
FILTER_PATTERNS        =
FILTER_SOURCE_FILES    = NO
FILTER_SOURCE_PATTERNS =
USE_MDFILE_AS_MAINPAGE =
SOURCE_BROWSER         = YES
INLINE_SOURCES         = NO
STRIP_CODE_COMMENTS    = YES
REFERENCED_BY_RELATION = NO
REFERENCES_RELATION    = NO
REFERENCES_LINK_SOURCE = YES
SOURCE_TOOLTIPS        = YES
USE_HTAGS              = NO
VERBATIM_HEADERS       = YES
CLANG_ASSISTED_PARSING = NO
CLANG_ADD_INC_PATHS    = YES
CLANG_OPTIONS          =
CLANG_DATABASE_PATH    =
ALPHABETICAL_INDEX     = YES
IGNORE_PREFIX          =
GENERATE_HTML          = YES
HTML_OUTPUT            = html
HTML_FILE_EXTENSION    = .html
HTML_HEADER            =
HTML_FOOTER            =
HTML_STYLESHEET        =
HTML_EXTRA_STYLESHEET  =
HTML_EXTRA_FILES       =
HTML_COLORSTYLE_HUE    = 220
HTML_COLORSTYLE_SAT    = 100
HTML_COLORSTYLE_GAMMA  = 80
HTML_TIMESTAMP         = NO
HTML_DYNAMIC_MENUS     = YES
HTML_DYNAMIC_SECTIONS  = NO
HTML_INDEX_NUM_ENTRIES = 100
GENERATE_DOCSET        = NO
DOCSET_FEEDNAME        = "Doxygen generated docs"
DOCSET_BUNDLE_ID       = org.doxygen.Project
DOCSET_PUBLISHER_ID    = org.doxygen.Publisher
DOCSET_PUBLISHER_NAME  = Publisher
GENERATE_HTMLHELP      = NO
CHM_FILE               =
HHC_LOCATION           =
GENERATE_CHI           = NO
CHM_INDEX_ENCODING     =
BINARY_TOC             = NO
TOC_EXPAND             = NO
GENERATE_QHP           = NO
QCH_FILE               =
QHP_NAMESPACE          = org.doxygen.Project
QHP_VIRTUAL_FOLDER     = doc
QHP_CUST_FILTER_NAME   =
QHP_CUST_FILTER_ATTRS  =
QHP_SECT_FILTER_ATTRS  =
QHG_LOCATION           =
GENERATE_ECLIPSEHELP   = NO
ECLIPSE_DOC_ID         = org.doxygen.Project
DISABLE_INDEX          = NO
GENERATE_TREEVIEW      = YES
FULL_SIDEBAR           = NO
ENUM_VALUES_PER_LINE   = 4
TREEVIEW_WIDTH         = 250
EXT_LINKS_IN_WINDOW    = NO
HTML_FORMULA_FORMAT    = png
FORMULA_FONTSIZE       = 10
FORMULA_TRANSPARENT    = YES
FORMULA_MACROFILE      =
USE_MATHJAX            = NO
MATHJAX_VERSION        = MathJax_2
MATHJAX_FORMAT         = HTML-CSS
MATHJAX_RELPATH        =
MATHJAX_EXTENSIONS     =
MATHJAX_CODEFILE       =
SEARCHENGINE           = YES
SERVER_BASED_SEARCH    = NO
EXTERNAL_SEARCH        = NO
SEARCHENGINE_URL       =
SEARCHDATA_FILE        = searchdata.xml
EXTERNAL_SEARCH_ID     =
EXTRA_SEARCH_MAPPINGS  =
GENERATE_LATEX         = YES
LATEX_OUTPUT           = latex
LATEX_CMD_NAME         =
MAKEINDEX_CMD_NAME     = makeindex
LATEX_MAKEINDEX_CMD    = makeindex
COMPACT_LATEX          = NO
PAPER_TYPE             = a4
EXTRA_PACKAGES         =
LATEX_HEADER           =
LATEX_FOOTER           =
LATEX_EXTRA_STYLESHEET =
LATEX_EXTRA_FILES      =
PDF_HYPERLINKS         = YES
USE_PDFLATEX           = YES
LATEX_BATCHMODE        = NO
LATEX_HIDE_INDICES     = NO
LATEX_BIB_STYLE        = plain
LATEX_TIMESTAMP        = NO
LATEX_EMOJI_DIRECTORY  =
GENERATE_RTF           = YES
RTF_OUTPUT             = rtf
COMPACT_RTF            = NO
RTF_HYPERLINKS         = NO
RTF_STYLESHEET_FILE    =
RTF_EXTENSIONS_FILE    =
GENERATE_MAN           = YES
MAN_OUTPUT             = man
MAN_EXTENSION          = .3
MAN_SUBDIR             =
MAN_LINKS              = NO
GENERATE_XML           = YES
XML_OUTPUT             = xml
XML_PROGRAMLISTING     = YES
XML_NS_MEMB_FILE_SCOPE = NO
GENERATE_DOCBOOK       = YES
DOCBOOK_OUTPUT         = docbook
GENERATE_AUTOGEN_DEF   = NO

GENERATE_PERLMOD       = NO
PERLMOD_LATEX          = NO
PERLMOD_PRETTY         = YES
PERLMOD_MAKEVAR_PREFIX =
ENABLE_PREPROCESSING   = YES
MACRO_EXPANSION        = NO
EXPAND_ONLY_PREDEF     = NO
SEARCH_INCLUDES        = YES
INCLUDE_PATH           =
INCLUDE_FILE_PATTERNS  =
PREDEFINED             =
EXPAND_AS_DEFINED      =
SKIP_FUNCTION_MACROS   = YES
TAGFILES               =
GENERATE_TAGFILE       =
ALLEXTERNALS           = NO
EXTERNAL_GROUPS        = YES
EXTERNAL_PAGES         = YES
CLASS_DIAGRAMS         = YES
DIA_PATH               =
HIDE_UNDOC_RELATIONS   = NO
HAVE_DOT               = YES
DOT_NUM_THREADS        = 0
DOT_FONTNAME           = Helvetica
DOT_FONTSIZE           = 10
DOT_FONTPATH           =
CLASS_GRAPH            = YES
COLLABORATION_GRAPH    = YES
GROUP_GRAPHS           = YES
UML_LOOK               = YES
UML_LIMIT_NUM_FIELDS   = 50
DOT_UML_DETAILS        = NO
DOT_WRAP_THRESHOLD     = 17
TEMPLATE_RELATIONS     = YES
INCLUDE_GRAPH          = YES
INCLUDED_BY_GRAPH      = YES
CALL_GRAPH             = NO
CALLER_GRAPH           = NO
GRAPHICAL_HIERARCHY    = YES
DIRECTORY_GRAPH        = YES
DOT_IMAGE_FORMAT       = png
INTERACTIVE_SVG        = NO
DOT_PATH               =
DOTFILE_DIRS           =
MSCFILE_DIRS           =
DIAFILE_DIRS           =
PLANTUML_JAR_PATH      =
PLANTUML_CFG_FILE      =
PLANTUML_INCLUDE_PATH  =
DOT_GRAPH_MAX_NODES    = 100
MAX_DOT_GRAPH_DEPTH    = 0
DOT_TRANSPARENT        = YES
DOT_MULTI_TARGETS      = NO
GENERATE_LEGEND        = YES
DOT_CLEANUP            = YES
```

