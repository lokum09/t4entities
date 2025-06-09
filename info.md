TODO:
- create script to generete of enums
- create script for handle the stored procedures
- handling special types: "geography", "geometry", "hierarchyid"

DONE:
- ~~refaktoryzacja i przeniesienie wspolnego kodu do common.t4 i uporzadkowanie kodu w common.t4~~
- ~~wyeliminowac Distinct() dla danych  o typach bazodanowych~~
- ~~naprawic kod tak zeby obslugiwal wszystkie funkcje z bazy min: GetSharingWorkStats i GetSharingWorkNorms~~
- ~~dodanie kodu ktory odrzuci generowanie funkcji dla typow assembly~~
- ~~poprawic new SqlParameter("@systemNo", @systemNo.ToRecords()){ SqlDbType = SqlDbType.Structured, TypeName = "xyz.SystemNo" },~~
- ~~utworzyc kod do tworzenia obiektow w ramach schematu - schema.dbo itd.~~
- ~~przygotowac osobny szablon dla generowania typow bazodanowych ktore mogo byc wykorzystywane przez funkcje jak i procedury~~
- ~~Musze zidentyfikowac obiekty ktore jako argument przyjmuja tabele i inaczej generowac dla nich kod~~
