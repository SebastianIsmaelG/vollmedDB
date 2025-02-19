-- Primera fila: Paciente con datos completos
INSERT INTO `consultas` (
  `id_medico`, `id_paciente`, `fecha`, `estado`, `signos_vitales`, `peso`, `PAS`, `PAD`,
  `temperatura_bucal`, `temperatura_rectal`, `temperatura_axilar`, `frecuencia_cardiaca`,
  `frecuencia_respiratoria`, `glicemia`, `alergias`, `motivo_consulta`, `diagnostico`,
  `procedimiento`, `id_receta_medica`
) VALUES (
  1, 1, '2023-10-25 09:30:00', 'en_curso',
  '{"frecuencia_cardiaca": 72, "frecuencia_respiratoria": 16, "temperatura_bucal": 36.5, "temperatura_rectal": 37.0, "temperatura_axilar": 36.2}',
  68.5, 120, 80, 36.5, 37.0, 36.2, 72, 16, 95.0,
  'Penicilina, Mariscos',
  'Dolor de cabeza persistente y fiebre leve.',
  'Migraña con fiebre leve.',
  'Se recetó paracetamol y reposo.',
  1
);

-- Segunda fila: Paciente con datos parciales
INSERT INTO `consultas` (
  `id_medico`, `id_paciente`, `fecha`, `estado`, `signos_vitales`, `peso`, `PAS`, `PAD`,
  `temperatura_bucal`, `temperatura_rectal`, `temperatura_axilar`, `frecuencia_cardiaca`,
  `frecuencia_respiratoria`, `glicemia`, `alergias`, `motivo_consulta`, `diagnostico`,
  `procedimiento`, `id_receta_medica`
) VALUES (
  2, 2, '2023-10-25 10:15:00', 'ingresado',
  '{"frecuencia_cardiaca": 80, "frecuencia_respiratoria": 18, "temperatura_bucal": 37.0, "temperatura_rectal": 37.5, "temperatura_axilar": 36.8}',
  75.0, 130, 85, 37.0, 37.5, 36.8, 80, 18, 110.0,
  'Ninguna',
  'Dolor abdominal y náuseas.',
  'Gastritis aguda.',
  'Se recetó omeprazol y dieta blanda.',
  2
);