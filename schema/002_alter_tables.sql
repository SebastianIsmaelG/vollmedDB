use `vollmed`;
--
-- Índices para tablas
--

-- --------------------------------------------------------
--
-- Indices de la tabla `establecimientos`
--
ALTER TABLE `establecimientos` ADD PRIMARY KEY (`id`),
MODIFY `id` int NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------
--
-- Indices de la tabla `box_atenciones`
--
ALTER TABLE `box_atenciones` ADD PRIMARY KEY (`id`),
MODIFY `id` int NOT NULL AUTO_INCREMENT,
ADD CONSTRAINT `fk_box_atenciones_establecimientos` FOREIGN KEY (`ubicacion`) REFERENCES `establecimientos` (`id`);

-- --------------------------------------------------------
--
-- Indices de la tabla `salud_previsionales`
--
ALTER TABLE `salud_previsionales` ADD PRIMARY KEY (`id`),
MODIFY `id` int NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------
--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos` ADD PRIMARY KEY (`id`),
MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------
--
-- Indices de la tabla `receta_medica`
--
ALTER TABLE `receta_medica` ADD PRIMARY KEY (`id`),
MODIFY `id` bigint not null AUTO_INCREMENT;

-- --------------------------------------------------------
--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos` ADD PRIMARY KEY (`id`),
MODIFY `id` bigint NOT NULL AUTO_INCREMENT,
ADD UNIQUE KEY `email` (`email`),
ADD UNIQUE KEY `DNI` (`DNI`),
ADD CONSTRAINT `fk_medicos_box_atenciones` FOREIGN KEY (`box_asignado`) REFERENCES `box_atenciones` (`id`);

-- --------------------------------------------------------
--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes` ADD PRIMARY KEY (`id`),
MODIFY `id` bigint NOT NULL AUTO_INCREMENT,
ADD UNIQUE KEY `email` (`email`),
ADD UNIQUE KEY `DNI` (`DNI`),
ADD CONSTRAINT `fk_pacientes_salud_previsionales` FOREIGN KEY (`salud_previsional`) REFERENCES `salud_previsionales` (`id`);

-- --------------------------------------------------------
--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas` ADD PRIMARY KEY (`id`),
MODIFY `id` bigint NOT NULL AUTO_INCREMENT,
ADD CONSTRAINT `fk_consultas_medicos` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id`),
ADD CONSTRAINT `fk_consultas_pacientes` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`),
ADD CONSTRAINT `fk_consultas_box_atenciones` FOREIGN KEY (`box_asignado`) REFERENCES `box_atenciones` (`id`),
ADD CONSTRAINT `fk_consultas_receta_medica` FOREIGN KEY (`id_receta_medica`) REFERENCES `receta_medica` (`id`);

-- --------------------------------------------------------
--
-- Indices de la tabla `receta_medica`
--
ALTER TABLE `receta_medica`
ADD CONSTRAINT `fk_receta_medica_consultas` FOREIGN KEY (`id_consulta`) REFERENCES `consultas` (`id`);

-- --------------------------------------------------------
--
-- Indices de la tabla `receta_medicacion`
--
ALTER TABLE `receta_medicacion` ADD PRIMARY KEY (`id`), 
MODIFY `id` bigint NOT NULL AUTO_INCREMENT,
ADD CONSTRAINT `fk_receta_medicacion_receta_medica` FOREIGN KEY (`id_receta_medica`) REFERENCES `receta_medica` (`id`),
ADD CONSTRAINT `fk_receta_medicacion_medicamentos` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamentos` (`id`);

-- --------------------------------------------------------
