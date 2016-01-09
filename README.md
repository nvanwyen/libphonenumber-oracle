# libphonenumber-oracle
PL/SQL Wrapper for Google libphonenumber library

Thie is a simple wrapper for the Google libphonenumber library (see: 
https://github.com/googlei18n/libphonenumber) in PL/SQL

This wrapper allows for use of the library within an Oracle RDBMS, so that 
PL/SQL and SQL can be used natively.

Installation
-----------------------------------
The installation of libphonenumber-oracle, is done through SQL Plus using the 
install_phonenumber.sql script. This script has been tested on Linux and in 
Oracle 11g and 12c for both the 1.6 and 1.7 JVM. It is assumed that a SYSDBA or 
account with the DBA privledges is executing the installation

Removal
-----------------------------------
The library is removed using the remove_phonenumber.sql script from an account 
that has a SYSDBA or DBA privledges
