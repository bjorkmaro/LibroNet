CREATE XML SCHEMA COLLECTION [dbo].[ObrazacJOPPD_v1_0] 
AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://e-porezna.porezna-uprava.hr/sheme/zahtjevi/ObrazacJOPPD/v1-0" targetNamespace="http://e-porezna.porezna-uprava.hr/sheme/zahtjevi/ObrazacJOPPD/v1-0" elementFormDefault="qualified">
  <xsd:complexType name="sAdresantTemeljni">
    <xsd:simpleContent>
      <xsd:extension base="t:tOgraniceniZnakovniNizMin2Max128" />
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name="sAutorTemeljni">
    <xsd:simpleContent>
      <xsd:extension base="xsd:string">
        <xsd:attribute name="dc" type="t:tOgraniceniZnakovniNizMin2Max128" use="required" fixed="http://purl.org/dc/elements/1.1/creator" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name="sDatumTemeljni">
    <xsd:simpleContent>
      <xsd:extension base="t:tDatum">
        <xsd:attribute name="dc" type="t:tOgraniceniZnakovniNizMin2Max128" use="required" fixed="http://purl.org/dc/elements/1.1/date" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name="sFormatTemeljni">
    <xsd:simpleContent>
      <xsd:extension base="t:tFormat">
        <xsd:attribute name="dc" type="t:tOgraniceniZnakovniNizMin2Max128" use="required" fixed="http://purl.org/dc/elements/1.1/format" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name="sIdentifikatorTemeljni">
    <xsd:simpleContent>
      <xsd:extension base="t:tIdentifikator">
        <xsd:attribute name="dc" type="t:tOgraniceniZnakovniNizMin2Max128" use="required" fixed="http://purl.org/dc/elements/1.1/identifier" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name="sIzvorTemeljni">
    <xsd:simpleContent>
      <xsd:extension base="t:tOgraniceniZnakovniNizMin2Max128">
        <xsd:attribute name="dc" type="t:tOgraniceniZnakovniNizMin2Max128" use="required" fixed="http://purl.org/dc/elements/1.1/source" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name="sJezikTemeljni">
    <xsd:simpleContent>
      <xsd:extension base="t:tJezik">
        <xsd:attribute name="dc" type="t:tOgraniceniZnakovniNizMin2Max128" use="required" fixed="http://purl.org/dc/elements/1.1/language" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name="sNaslovTemeljni">
    <xsd:simpleContent>
      <xsd:extension base="t:tOgraniceniZnakovniNizMin2Max128">
        <xsd:attribute name="dc" type="t:tOgraniceniZnakovniNizMin2Max128" use="required" fixed="http://purl.org/dc/elements/1.1/title" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name="sOdnosTemeljni">
    <xsd:simpleContent>
      <xsd:extension base="t:tIdentifikator">
        <xsd:attribute name="dc" type="t:tOgraniceniZnakovniNizMin2Max128" use="required" fixed="http://purl.org/dc/elements/1.1/relation" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name="sTipTemeljni">
    <xsd:simpleContent>
      <xsd:extension base="t:tTip">
        <xsd:attribute name="dc" type="t:tOgraniceniZnakovniNizMin2Max128" use="required" fixed="http://purl.org/dc/elements/1.1/type" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name="sUskladjenostTemeljni">
    <xsd:simpleContent>
      <xsd:extension base="xsd:string">
        <xsd:attribute name="dc" type="t:tOgraniceniZnakovniNizMin2Max128" use="required" fixed="http://purl.org/dc/terms/conformsTo" />
      </xsd:extension>
    </xsd:simpleContent>
  </xsd:complexType>
  <xsd:complexType name="sAdresa">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Mjesto" type="t:tOgraniceniZnakovniNizMin2Max128" />
          <xsd:element name="Ulica" type="t:tOgraniceniZnakovniNizMin2Max128" />
          <xsd:element name="Broj" type="t:tAdresaBroj" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sDoprinosi">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="GeneracijskaSolidarnost" type="t:sGeneracijskaSolidarnost" />
          <xsd:element name="KapitaliziranaStednja" type="t:sKapitaliziranaStednja" />
          <xsd:element name="ZdravstvenoOsiguranje" type="t:sZdravstvenoOsiguranje" />
          <xsd:element name="Zaposljavanje" type="t:sZaposljavanje" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sGeneracijskaSolidarnost">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="P1" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P2" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P3" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P4" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P5" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P6" type="t:tNonNegativeDecimal15-2" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sIzvjesceSastavio">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Ime" type="t:tOgraniceniZnakovniNizMin2Max128" />
          <xsd:element name="Prezime" type="t:tOgraniceniZnakovniNizMin2Max128" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sKapitaliziranaStednja">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="P1" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P2" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P3" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P4" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P5" type="t:tNonNegativeDecimal15-2" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sMetapodaci">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Naslov" type="t:sNaslovTemeljni" />
          <xsd:element name="Autor" type="t:sAutorTemeljni" />
          <xsd:element name="Datum" type="t:sDatumTemeljni" />
          <xsd:element name="Format" type="t:sFormatTemeljni" />
          <xsd:element name="Jezik" type="t:sJezikTemeljni" />
          <xsd:element name="Identifikator" type="t:sIdentifikatorTemeljni" />
          <xsd:element name="Uskladjenost" type="t:sNaslovTemeljni" />
          <xsd:element name="Tip" type="t:sTipTemeljni" />
          <xsd:element name="Adresant" type="t:sAdresantTemeljni" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sObrazacJOPPD">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Metapodaci" type="t:sMetapodaci" />
          <xsd:element name="StranaA" type="t:sStranaA" />
          <xsd:element name="StranaB" type="t:sStranaB" />
        </xsd:sequence>
        <xsd:attribute name="verzijaSheme" type="xsd:anySimpleType" use="required" fixed="1.0" />
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sObveznikPlacanja">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:choice>
            <xsd:sequence>
              <xsd:element name="Ime" type="t:tOgraniceniZnakovniNizMin2Max128" />
              <xsd:element name="Prezime" type="t:tOgraniceniZnakovniNizMin2Max128" />
            </xsd:sequence>
            <xsd:element name="Naziv" type="t:tOgraniceniZnakovniNizMin2Max128" />
          </xsd:choice>
          <xsd:element name="Adresa" type="t:sAdresa" />
          <xsd:element name="Email" type="t:tEmail" />
          <xsd:element name="OIB" type="t:tOIB" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sPodnositeljIzvjesca">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:choice>
            <xsd:sequence>
              <xsd:element name="Ime" type="t:tOgraniceniZnakovniNizMin2Max128" />
              <xsd:element name="Prezime" type="t:tOgraniceniZnakovniNizMin2Max128" />
            </xsd:sequence>
            <xsd:element name="Naziv" type="t:tOgraniceniZnakovniNizMin2Max128" />
          </xsd:choice>
          <xsd:element name="Adresa" type="t:sAdresa" />
          <xsd:element name="Email" type="t:tEmail" />
          <xsd:element name="OIB" type="t:tOIB" />
          <xsd:element name="Oznaka" type="t:tOznakaPodnositelja" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sPredujamPoreza">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="P1" type="t:tDecimal15-2" />
          <xsd:element name="P11" type="t:tDecimal15-2" />
          <xsd:element name="P12" type="t:tDecimal15-2" />
          <xsd:element name="P2" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P3" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P4" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P5" type="t:tNonNegativeDecimal15-2" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sPrimatelji">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="P" minOccurs="0" maxOccurs="unbounded">
            <xsd:complexType>
              <xsd:complexContent>
                <xsd:restriction base="xsd:anyType">
                  <xsd:sequence>
                    <xsd:element name="P1" type="t:tRedniBroj" />
                    <xsd:element name="P2" type="t:tSifraOpcineGrada" />
                    <xsd:element name="P3" type="t:tSifraOpcineGrada" />
                    <xsd:element name="P4" type="t:tOIB" />
                    <xsd:element name="P5" type="t:tOgraniceniZnakovniNizMin2Max128" />
                    <xsd:element name="P61" type="t:tOznakaStjecatelja" />
                    <xsd:element name="P62" type="t:tOznakaPrimici" />
                    <xsd:element name="P71" type="t:tOznakaMO" />
                    <xsd:element name="P72" type="t:tOznakaInvaliditet" />
                    <xsd:element name="P8" type="t:tOznakaMjesec" />
                    <xsd:element name="P9" type="t:tOznakaRadnoVrijeme" />
                    <xsd:element name="P10" type="t:tRadniSati" />
                    <xsd:element name="P101" type="xsd:date" />
                    <xsd:element name="P102" type="xsd:date" />
                    <xsd:element name="P11" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P12" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P121" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P122" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P123" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P124" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P125" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P126" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P127" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P128" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P129" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P131" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P132" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P133" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P134" type="t:tDecimal15-2" />
                    <xsd:element name="P135" type="t:tDecimal15-2" />
                    <xsd:element name="P141" type="t:tDecimal15-2" />
                    <xsd:element name="P142" type="t:tDecimal15-2" />
                    <xsd:element name="P151" type="t:tOznakaNeoporezivogPrimitka" />
                    <xsd:element name="P152" type="t:tNonNegativeDecimal15-2" />
                    <xsd:element name="P161" type="t:tOznakaNacinaIsplate" />
                    <xsd:element name="P162" type="t:tDecimal15-2" />
                    <xsd:element name="P17" type="t:tNonNegativeDecimal15-2" />
                  </xsd:sequence>
                </xsd:restriction>
              </xsd:complexContent>
            </xsd:complexType>
          </xsd:element>
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sStranaA">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="DatumIzvjesca" type="xsd:date" />
          <xsd:element name="OznakaIzvjesca" type="t:tOznakaIzvjesca" />
          <xsd:element name="VrstaIzvjesca" type="t:tVrstaIzvjesca" />
          <xsd:element name="PodnositeljIzvjesca" type="t:sPodnositeljIzvjesca" />
          <xsd:element name="ObveznikPlacanja" type="t:sObveznikPlacanja" minOccurs="0" />
          <xsd:element name="BrojOsoba" type="t:tBrojOsoba" />
          <xsd:element name="BrojRedaka" type="t:tBrojRedaka" />
          <xsd:element name="PredujamPoreza" type="t:sPredujamPoreza" />
          <xsd:element name="Doprinosi" type="t:sDoprinosi" />
          <xsd:element name="IsplaceniNeoporeziviPrimici" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="KamataMO2" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="IzvjesceSastavio" type="t:sIzvjesceSastavio" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sStranaB">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Primatelji" type="t:sPrimatelji" maxOccurs="unbounded" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sZaposljavanje">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="P1" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P2" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P3" type="t:tNonNegativeDecimal15-2" minOccurs="0" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="sZdravstvenoOsiguranje">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="P1" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P2" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P3" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P4" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P5" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P6" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P7" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P8" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P9" type="t:tNonNegativeDecimal15-2" />
          <xsd:element name="P10" type="t:tNonNegativeDecimal15-2" />
        </xsd:sequence>
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:simpleType name="tAdresaBroj">
    <xsd:restriction base="xsd:string">
      <xsd:maxLength value="10" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tBrojOsoba">
    <xsd:restriction base="xsd:positiveInteger">
      <xsd:minInclusive value="1" />
      <xsd:maxInclusive value="9999999" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tBrojRedaka">
    <xsd:restriction base="xsd:positiveInteger">
      <xsd:minInclusive value="1" />
      <xsd:maxInclusive value="9999999999" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tDatum">
    <xsd:restriction base="xsd:dateTime" />
  </xsd:simpleType>
  <xsd:simpleType name="tDecimal15-2">
    <xsd:restriction base="xsd:decimal">
      <xsd:totalDigits value="15" />
      <xsd:fractionDigits value="2" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tEmail">
    <xsd:restriction base="xsd:string" />
  </xsd:simpleType>
  <xsd:simpleType name="tFormat">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="text/xml" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tIdentifikator">
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tJezik">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="hr-HR" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tNonNegativeDecimal15-2">
    <xsd:restriction base="xsd:decimal">
      <xsd:totalDigits value="15" />
      <xsd:fractionDigits value="2" />
      <xsd:minInclusive value="0" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOIB">
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="\d{11}" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOgraniceniZnakovniNizMin2Max128">
    <xsd:restriction base="xsd:string">
      <xsd:minLength value="2" />
      <xsd:maxLength value="128" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznaka1">
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="[0-9]{1}" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznaka2">
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="[0-9]{2}" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznaka4">
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="[0-9]{4}" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznakaInvaliditet">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="0" />
      <xsd:enumeration value="1" />
      <xsd:enumeration value="2" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznakaIzvjesca">
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="[0-9]{5}" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznakaMO">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="0" />
      <xsd:enumeration value="1" />
      <xsd:enumeration value="2" />
      <xsd:enumeration value="3" />
      <xsd:enumeration value="4" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznakaMjesec">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="0" />
      <xsd:enumeration value="1" />
      <xsd:enumeration value="2" />
      <xsd:enumeration value="3" />
      <xsd:enumeration value="4" />
      <xsd:enumeration value="5" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznakaNacinaIsplate">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="0" />
      <xsd:enumeration value="1" />
      <xsd:enumeration value="2" />
      <xsd:enumeration value="3" />
      <xsd:enumeration value="4" />
      <xsd:enumeration value="5" />
      <xsd:enumeration value="6" />
      <xsd:enumeration value="7" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznakaNeoporezivogPrimitka">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="0" />
      <xsd:enumeration value="01" />
      <xsd:enumeration value="02" />
      <xsd:enumeration value="03" />
      <xsd:enumeration value="04" />
      <xsd:enumeration value="05" />
      <xsd:enumeration value="06" />
      <xsd:enumeration value="07" />
      <xsd:enumeration value="08" />
      <xsd:enumeration value="09" />
      <xsd:enumeration value="10" />
      <xsd:enumeration value="11" />
      <xsd:enumeration value="12" />
      <xsd:enumeration value="13" />
      <xsd:enumeration value="14" />
      <xsd:enumeration value="15" />
      <xsd:enumeration value="16" />
      <xsd:enumeration value="17" />
      <xsd:enumeration value="18" />
      <xsd:enumeration value="19" />
      <xsd:enumeration value="20" />
      <xsd:enumeration value="21" />
      <xsd:enumeration value="22" />
      <xsd:enumeration value="23" />
      <xsd:enumeration value="24" />
      <xsd:enumeration value="25" />
      <xsd:enumeration value="26" />
      <xsd:enumeration value="27" />
      <xsd:enumeration value="28" />
      <xsd:enumeration value="29" />
      <xsd:enumeration value="30" />
      <xsd:enumeration value="31" />
      <xsd:enumeration value="32" />
      <xsd:enumeration value="33" />
      <xsd:enumeration value="34" />
      <xsd:enumeration value="35" />
      <xsd:enumeration value="36" />
      <xsd:enumeration value="37" />
      <xsd:enumeration value="38" />
      <xsd:enumeration value="39" />
      <xsd:enumeration value="40" />
      <xsd:enumeration value="41" />
      <xsd:enumeration value="42" />
      <xsd:enumeration value="43" />
      <xsd:enumeration value="44" />
      <xsd:enumeration value="45" />
      <xsd:enumeration value="46" />
      <xsd:enumeration value="47" />
      <xsd:enumeration value="48" />
      <xsd:enumeration value="49" />
      <xsd:enumeration value="50" />
      <xsd:enumeration value="51" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznakaPodnositelja">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="1" />
      <xsd:enumeration value="2" />
      <xsd:enumeration value="3" />
      <xsd:enumeration value="4" />
      <xsd:enumeration value="5" />
      <xsd:enumeration value="6" />
      <xsd:enumeration value="7" />
      <xsd:enumeration value="8" />
      <xsd:enumeration value="9" />
      <xsd:enumeration value="10" />
      <xsd:enumeration value="11" />
      <xsd:enumeration value="12" />
      <xsd:enumeration value="13" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznakaPrimici">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="0000" />
      <xsd:enumeration value="0001" />
      <xsd:enumeration value="0002" />
      <xsd:enumeration value="0003" />
      <xsd:enumeration value="0004" />
      <xsd:enumeration value="0021" />
      <xsd:enumeration value="0022" />
      <xsd:enumeration value="0023" />
      <xsd:enumeration value="0024" />
      <xsd:enumeration value="0025" />
      <xsd:enumeration value="0026" />
      <xsd:enumeration value="0027" />
      <xsd:enumeration value="0028" />
      <xsd:enumeration value="0041" />
      <xsd:enumeration value="0042" />
      <xsd:enumeration value="0043" />
      <xsd:enumeration value="0044" />
      <xsd:enumeration value="0045" />
      <xsd:enumeration value="0046" />
      <xsd:enumeration value="0051" />
      <xsd:enumeration value="0052" />
      <xsd:enumeration value="0061" />
      <xsd:enumeration value="0062" />
      <xsd:enumeration value="0063" />
      <xsd:enumeration value="0064" />
      <xsd:enumeration value="0071" />
      <xsd:enumeration value="0081" />
      <xsd:enumeration value="0082" />
      <xsd:enumeration value="0083" />
      <xsd:enumeration value="0084" />
      <xsd:enumeration value="0085" />
      <xsd:enumeration value="0086" />
      <xsd:enumeration value="0091" />
      <xsd:enumeration value="0101" />
      <xsd:enumeration value="0102" />
      <xsd:enumeration value="0103" />
      <xsd:enumeration value="0201" />
      <xsd:enumeration value="0202" />
      <xsd:enumeration value="0203" />
      <xsd:enumeration value="0204" />
      <xsd:enumeration value="0205" />
      <xsd:enumeration value="0206" />
      <xsd:enumeration value="0207" />
      <xsd:enumeration value="0208" />
      <xsd:enumeration value="0209" />
      <xsd:enumeration value="0210" />
      <xsd:enumeration value="0211" />
      <xsd:enumeration value="0212" />
      <xsd:enumeration value="0213" />
      <xsd:enumeration value="0214" />
      <xsd:enumeration value="0301" />
      <xsd:enumeration value="0302" />
      <xsd:enumeration value="0303" />
      <xsd:enumeration value="0321" />
      <xsd:enumeration value="0322" />
      <xsd:enumeration value="0323" />
      <xsd:enumeration value="0331" />
      <xsd:enumeration value="0332" />
      <xsd:enumeration value="0333" />
      <xsd:enumeration value="0334" />
      <xsd:enumeration value="0401" />
      <xsd:enumeration value="0402" />
      <xsd:enumeration value="0403" />
      <xsd:enumeration value="0404" />
      <xsd:enumeration value="0405" />
      <xsd:enumeration value="0406" />
      <xsd:enumeration value="1001" />
      <xsd:enumeration value="1002" />
      <xsd:enumeration value="1003" />
      <xsd:enumeration value="1004" />
      <xsd:enumeration value="1005" />
      <xsd:enumeration value="2001" />
      <xsd:enumeration value="3001" />
      <xsd:enumeration value="3002" />
      <xsd:enumeration value="4001" />
      <xsd:enumeration value="4002" />
      <xsd:enumeration value="4003" />
      <xsd:enumeration value="4004" />
      <xsd:enumeration value="4005" />
      <xsd:enumeration value="4006" />
      <xsd:enumeration value="4007" />
      <xsd:enumeration value="4008" />
      <xsd:enumeration value="4009" />
      <xsd:enumeration value="4010" />
      <xsd:enumeration value="4011" />
      <xsd:enumeration value="4012" />
      <xsd:enumeration value="4013" />
      <xsd:enumeration value="4014" />
      <xsd:enumeration value="4015" />
      <xsd:enumeration value="4016" />
      <xsd:enumeration value="4017" />
      <xsd:enumeration value="4018" />
      <xsd:enumeration value="4019" />
      <xsd:enumeration value="4020" />
      <xsd:enumeration value="4021" />
      <xsd:enumeration value="4022" />
      <xsd:enumeration value="4023" />
      <xsd:enumeration value="4024" />
      <xsd:enumeration value="4025" />
      <xsd:enumeration value="4026" />
      <xsd:enumeration value="4027" />
      <xsd:enumeration value="4028" />
      <xsd:enumeration value="4029" />
      <xsd:enumeration value="4030" />
      <xsd:enumeration value="4031" />
      <xsd:enumeration value="4032" />
      <xsd:enumeration value="4033" />
      <xsd:enumeration value="4034" />
      <xsd:enumeration value="4035" />
      <xsd:enumeration value="4036" />
      <xsd:enumeration value="4037" />
      <xsd:enumeration value="5001" />
      <xsd:enumeration value="5002" />
      <xsd:enumeration value="5003" />
      <xsd:enumeration value="5004" />
      <xsd:enumeration value="5005" />
      <xsd:enumeration value="5101" />
      <xsd:enumeration value="5102" />
      <xsd:enumeration value="5103" />
      <xsd:enumeration value="5104" />
      <xsd:enumeration value="5105" />
      <xsd:enumeration value="5106" />
      <xsd:enumeration value="5107" />
      <xsd:enumeration value="5108" />
      <xsd:enumeration value="5109" />
      <xsd:enumeration value="5110" />
      <xsd:enumeration value="5111" />
      <xsd:enumeration value="5112" />
      <xsd:enumeration value="5701" />
      <xsd:enumeration value="5702" />
      <xsd:enumeration value="5703" />
      <xsd:enumeration value="5721" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznakaRadnoVrijeme">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="0" />
      <xsd:enumeration value="1" />
      <xsd:enumeration value="2" />
      <xsd:enumeration value="3" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tOznakaStjecatelja">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="0000" />
      <xsd:enumeration value="0001" />
      <xsd:enumeration value="0002" />
      <xsd:enumeration value="0003" />
      <xsd:enumeration value="0004" />
      <xsd:enumeration value="0005" />
      <xsd:enumeration value="0006" />
      <xsd:enumeration value="0007" />
      <xsd:enumeration value="0008" />
      <xsd:enumeration value="0009" />
      <xsd:enumeration value="0021" />
      <xsd:enumeration value="0022" />
      <xsd:enumeration value="0023" />
      <xsd:enumeration value="0024" />
      <xsd:enumeration value="0031" />
      <xsd:enumeration value="0032" />
      <xsd:enumeration value="0033" />
      <xsd:enumeration value="0101" />
      <xsd:enumeration value="0102" />
      <xsd:enumeration value="0103" />
      <xsd:enumeration value="0104" />
      <xsd:enumeration value="0105" />
      <xsd:enumeration value="0106" />
      <xsd:enumeration value="0107" />
      <xsd:enumeration value="0108" />
      <xsd:enumeration value="0121" />
      <xsd:enumeration value="0201" />
      <xsd:enumeration value="1001" />
      <xsd:enumeration value="2001" />
      <xsd:enumeration value="3001" />
      <xsd:enumeration value="4001" />
      <xsd:enumeration value="4002" />
      <xsd:enumeration value="5001" />
      <xsd:enumeration value="5002" />
      <xsd:enumeration value="5101" />
      <xsd:enumeration value="5102" />
      <xsd:enumeration value="5103" />
      <xsd:enumeration value="5104" />
      <xsd:enumeration value="5201" />
      <xsd:enumeration value="5202" />
      <xsd:enumeration value="5203" />
      <xsd:enumeration value="5204" />
      <xsd:enumeration value="5205" />
      <xsd:enumeration value="5206" />
      <xsd:enumeration value="5207" />
      <xsd:enumeration value="5208" />
      <xsd:enumeration value="5209" />
      <xsd:enumeration value="5210" />
      <xsd:enumeration value="5211" />
      <xsd:enumeration value="5212" />
      <xsd:enumeration value="5213" />
      <xsd:enumeration value="5301" />
      <xsd:enumeration value="5302" />
      <xsd:enumeration value="5401" />
      <xsd:enumeration value="5402" />
      <xsd:enumeration value="5403" />
      <xsd:enumeration value="5501" />
      <xsd:enumeration value="5601" />
      <xsd:enumeration value="5602" />
      <xsd:enumeration value="5603" />
      <xsd:enumeration value="5604" />
      <xsd:enumeration value="5605" />
      <xsd:enumeration value="5606" />
      <xsd:enumeration value="5607" />
      <xsd:enumeration value="5608" />
      <xsd:enumeration value="5701" />
      <xsd:enumeration value="5702" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tRadniSati">
    <xsd:restriction base="xsd:int">
      <xsd:minInclusive value="0" />
      <xsd:maxInclusive value="9999" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tRedniBroj">
    <xsd:restriction base="xsd:long">
      <xsd:minInclusive value="1" />
      <xsd:maxInclusive value="9999999999" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tSifraOpcineGrada">
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="[0-9]{5}" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tTip">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="Elektronički obrazac" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="tVrstaIzvjesca">
    <xsd:restriction base="xsd:integer">
      <xsd:enumeration value="1" />
      <xsd:enumeration value="2" />
      <xsd:enumeration value="3" />
    </xsd:restriction>
  </xsd:simpleType>
</xsd:schema>'
GO
