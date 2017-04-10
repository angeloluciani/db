DECLARE
  CURSOR cs1 IS SELECT object_name, object_type FROM user_objects
               WHERE object_name NOT LIKE 'BIN$%' ORDER BY object_type DESC;
  CURSOR cs2 IS SELECT table_name, constraint_name FROM user_constraints
               WHERE constraint_type = 'R' AND constraint_name NOT LIKE 'SYS_%';
BEGIN
  IF UPPER(USER) = 'SYSTEM' THEN
    DBMS_OUTPUT.PUT_LINE('ERROR - brasando utenza system il database smette di fungere') ;
  ELSE
    FOR c2 IN cs2 LOOP
      BEGIN
        EXECUTE IMMEDIATE('ALTER TABLE '|| c2.table_name ||' DISABLE CONSTRAINT '||
                          c2.constraint_name);
      EXCEPTION WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR - '||SUBSTR(SQLERRM, 1, INSTR(SQLERRM, ':')-1)||
                             ' - Disable Constraint Failed');
      END;
    END LOOP;
    FOR c1 IN cs1 LOOP
      IF ( c1.object_type = 'TABLE' ) THEN
        BEGIN
          EXECUTE IMMEDIATE( 'TRUNCATE '|| c1.object_type ||' '|| c1.object_name );
        EXCEPTION WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE('ERROR - '||SUBSTR(SQLERRM, 1, INSTR(SQLERRM, ':')-1)||
                               ' - Truncate Table Failed');
        END;
        BEGIN
    	     EXECUTE IMMEDIATE( 'DROP '|| c1.object_type ||' '|| c1.object_name ||' CASCADE CONSTRAINTS' );
        EXCEPTION WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE('ERROR - '||SUBSTR(SQLERRM, 1, INSTR(SQLERRM, ':')-1)||
                               ' - Drop Table Failed');
        END;
      ELSIF ( c1.object_type IN ('VIEW', 'SYNONYM', 'SEQUENCE', 'PROCEDURE', 'FUNCTION', 'MATERIALIZED VIEW', 'PACKAGE', 'TYPE') ) THEN
        BEGIN
          EXECUTE IMMEDIATE( 'DROP '|| c1.object_type ||' '|| c1.object_name );
        EXCEPTION WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE('ERROR - '||SUBSTR(SQLERRM, 1, INSTR(SQLERRM, ':')-1)||
                               ' - Drop '|| c1.object_type ||' = '|| c1.object_name ||' Failed');
        END;
      END IF;
    END LOOP;
  END IF;
END;
/
