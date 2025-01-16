local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("ino", {
	-- Sketch básico con setup y loop
	s("sketch", {
		t("#include <Arduino.h>\n\nvoid setup() {\n    "),
		i(1, "// Inicialización"),
		t("\n}\n\nvoid loop() {\n    "),
		i(2, "// Ciclo principal"),
		t("\n}\n"),
	}),

	-- Definición de pin
	s("pin", {
		t("const int "),
		i(1, "pinName"),
		t(" = "),
		i(2, "pinNumber"),
		t(";\n"),
	}),

	-- Lectura de pin digital
	s("readDigital", {
		t("int "),
		i(1, "value"),
		t(" = digitalRead("),
		i(2, "pinName"),
		t(");\n"),
	}),

	-- Escritura de pin digital
	s("writeDigital", {
		t("digitalWrite("),
		i(1, "pinName"),
		t(", "),
		i(2, "value"),
		t(");\n"),
	}),

	-- Configuración de pin como entrada o salida
	s("pinMode", {
		t("pinMode("),
		i(1, "pinName"),
		t(", "),
		i(2, "INPUT"),
		t(");\n"),
	}),

	-- Lectura de pin analógico
	s("readAnalog", {
		t("int "),
		i(1, "value"),
		t(" = analogRead("),
		i(2, "pinName"),
		t(");\n"),
	}),

	-- Escritura en PWM
	s("writePWM", {
		t("analogWrite("),
		i(1, "pinName"),
		t(", "),
		i(2, "value"),
		t(");\n"),
	}),

	-- Configuración de interrupción
	s("interrupt", {
		t("attachInterrupt(digitalPinToInterrupt("),
		i(1, "pinName"),
		t("), "),
		i(2, "ISR"),
		t(", "),
		i(3, "RISING"),
		t(");\n"),
	}),

	-- Control de LED (encender y apagar)
	s("ledControl", {
		t("digitalWrite("),
		i(1, "ledPin"),
		t(", "),
		i(2, "HIGH"),
		t("); // Enciende el LED\n"),
		t("digitalWrite("),
		i(1, "ledPin"),
		t(", "),
		i(2, "LOW"),
		t("); // Apaga el LED\n"),
	}),

	-- Delay
	s("delay", {
		t("delay("),
		i(1, "1000"),
		t("); // Delay en milisegundos\n"),
	}),

	-- Serial Begin
	s("serialBegin", {
		t("Serial.begin("),
		i(1, "9600"),
		t(");\n"),
	}),

	-- Enviar datos por serial
	s("serialPrint", {
		t('Serial.print("'),
		i(1, "message"),
		t('");\n'),
	}),

	-- Leer un botón (condicional)
	s("button", {
		t("if (digitalRead("),
		i(1, "buttonPin"),
		t(") == HIGH) {\n    "),
		i(2, "// Acción cuando se presiona el botón"),
		t("\n}"),
	}),

	-- Definición de una función
	s("function", {
		t("void "),
		i(1, "functionName"),
		t("() {\n    "),
		i(2, "// Código de la función"),
		t("\n}\n"),
	}),

	-- Bucle for
	s("for", {
		t("for (int "),
		i(1, "i"),
		t(" = 0; "),
		i(1),
		t(" < "),
		i(2, "limit"),
		t("; "),
		i(1),
		t("++) {\n    "),
		i(3, "// Código dentro del bucle"),
		t("\n}\n"),
	}),

	-- Bucle while
	s("while", {
		t("while ("),
		i(1, "condition"),
		t(") {\n    "),
		i(2, "// Código dentro del bucle"),
		t("\n}\n"),
	}),

	-- Condicional if
	s("if", {
		t("if ("),
		i(1, "condition"),
		t(") {\n    "),
		i(2, "// Acción si es verdadero"),
		t("\n} else {\n    "),
		i(3, "// Acción si es falso"),
		t("\n}\n"),
	}),

	-- Función de mapeo
	s("map", {
		t("int "),
		i(1, "result"),
		t(" = map("),
		i(2, "value"),
		t(", "),
		i(3, "inMin"),
		t(", "),
		i(4, "inMax"),
		t(", "),
		i(5, "outMin"),
		t(", "),
		i(6, "outMax"),
		t(");\n"),
	}),

	-- Configuración de un temporizador
	s("timer", {
		t("unsigned long "),
		i(1, "previousMillis"),
		t(" = 0;\nunsigned long "),
		i(2, "interval"),
		t(" = "),
		i(3, "1000"),
		t(";\n"),
	}),

	-- Sensor de temperatura (ejemplo)
	s("tempSensor", {
		t("int "),
		i(1, "sensorValue"),
		t(" = analogRead("),
		i(2, "sensorPin"),
		t(");\n"),
		t("float "),
		i(3, "voltage"),
		t(" = sensorValue * (5.0 / 1023.0);\n"),
		t("float "),
		i(4, "temperature"),
		t(" = (voltage - 0.5) * 100.0;\n"),
		t('Serial.print("Temperature: ");\nSerial.println(temperature);\n'),
	}),

	-- Escribir un valor en el EEPROM
	s("eepromWrite", {
		t("EEPROM.write("),
		i(1, "address"),
		t(", "),
		i(2, "value"),
		t(");\n"),
	}),

	-- Leer un valor desde el EEPROM
	s("eepromRead", {
		t("int "),
		i(1, "value"),
		t(" = EEPROM.read("),
		i(2, "address"),
		t(");\n"),
	}),
})
