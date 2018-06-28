-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-06-2018 a las 21:44:45
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aspu`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`) VALUES
(1, 'economia'),
(2, 'categoria 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `contenido` text,
  `usuario` int(11) NOT NULL,
  `publicacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id`, `fecha`, `contenido`, `usuario`, `publicacion`) VALUES
(1, '2018-06-14 01:05:05', 'Esto es un comentario', 2, 1),
(2, '2018-06-16 16:18:34', 'Las tarjetas se pueden organizar en columnas tipo mampostería con solo CSS envolviéndolas .card-columns. Las tarjetas se crean con columnpropiedades CSS en lugar de flexbox para facilitar la alineación. Las tarjetas se ordenan de arriba a abajo y de izquierda a derecha.', 1, 1),
(3, '2018-06-16 16:30:37', NULL, 1, 1),
(4, '2018-06-16 17:07:00', '<p>dfdsfsdfgdfghh</p>', 1, 1),
(5, '2018-06-16 17:11:48', '<p>Primer <span style="background-color: rgb(255, 255, 0);">comentario&nbsp;</span></p>', 3, 1),
(6, '2018-06-16 17:12:21', '<p>Segundo <span style="font-family: Verdana; color: rgb(0, 255, 0);">Comentario</span></p>', 3, 1),
(7, '2018-06-21 00:06:15', '<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec ante vel sapien dapibus mollis et in nunc. Quisque porttitor ligula nulla, sed tempor sapien lacinia nec. Pellentesque nec eleifend augue. Nulla id diam tortor. Fusce ac magna vitae nibh tempus vestibulum. In eu tellus ultrices, placerat justo ut, euismod justo. Suspendisse dignissim, tellus eu feugiat ornare, tortor orci ultricies dui, quis finibus risus dui id risus. Fusce eu leo et risus facilisis semper.</span><br></p>', 2, 8),
(8, '2018-06-21 00:06:31', '<p><span style="font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec ante vel sapien dapibus mollis et in nunc. Quisque porttitor ligula nulla, sed tempor sapien lacinia nec. Pellentesque nec eleifend augue. Nulla id diam tortor. Fusce ac magna vitae nibh tempus vestibulum. In eu tellus ultrices, placerat justo ut, euismod justo. Suspendisse dignissim, tellus eu feugiat ornare, tortor orci ultricies dui, quis finibus risus dui id risus. Fusce eu leo et risus facilisis semper.</span><br></p>', 2, 8),
(9, '2018-06-21 10:51:27', '<p>Comentario</p>', 2, 8),
(10, '2018-06-26 17:43:58', '<p>Esto es un Comentario</p>', 2, 3),
(11, '2018-06-27 09:05:10', '<p>Esto es un comentario</p>', 2, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicacion`
--

CREATE TABLE `publicacion` (
  `id` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL,
  `contenido` text NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `palabras_clave` varchar(60) DEFAULT NULL,
  `usuario` int(11) NOT NULL,
  `categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `publicacion`
--

INSERT INTO `publicacion` (`id`, `titulo`, `fecha`, `contenido`, `descripcion`, `palabras_clave`, `usuario`, `categoria`) VALUES
(1, 'Noticia 1', '2018-06-13 06:00:00', '<p><span style="background-color: rgb(255, 255, 0);">dfgfggffdgdfgdf</span></p>', 'Lorem ipsum dolor sit amet.', 'Ufps, Aspu, Noticias', 2, 1),
(2, 'Noticia 2', '2018-06-16 23:54:44', '<p> contenido de una noticia  </p>', 'Lorem ipsum dolor sit amet.', 'Ufps, Aspu, Noticias', 1, 1),
(3, 'Noticia 3', '2018-06-17 00:33:04', '<p>Esto es una noticia de economia</p>', 'Lorem ipsum dolor sit amet.', 'Ufps, Aspu, Noticias', 1, 1),
(4, 'Noticia 4', '2018-06-17 01:01:55', '<p><span style="background-color: rgb(255, 255, 0);">vbbcvbcvb</span></p>', 'Lorem ipsum dolor sit amet.', 'Ufps, Aspu, Noticias', 1, 1),
(5, 'Noticia 5', '2018-06-17 02:13:04', '<p>ghgfhhgf</p>', 'Lorem ipsum dolor sit amet.', 'Ufps, Aspu, Noticias', 1, 1),
(6, 'Noticia 6', '2018-06-17 21:48:24', '<p><br></p>', 'Lorem ipsum dolor sit amet.', 'Ufps, Aspu, Noticias', 2, 1),
(7, 'Noticia 7', '2018-06-17 21:49:39', '<p>gffffggdgd</p>', 'Lorem ipsum dolor sit amet.', 'Ufps, Aspu, Noticias', 2, 2),
(8, 'Noticia 8', '2018-06-17 22:30:18', '<p><span style="background-color: rgb(255, 255, 255);">Esto es una Noticia</span></p>', 'Lorem ipsum dolor sit amet.', 'Ufps, Aspu, Noticias', 2, 1),
(9, 'Web', '2018-06-27 09:04:43', '<p><span style="background-color: rgb(99, 99, 99);">Esto es una notica&nbsp;</span></p>', 'Descripcion', 'UFps', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `apellidos` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `tipo_usuario` varchar(15) NOT NULL,
  `genero` varchar(15) DEFAULT NULL,
  `especializacion` varchar(45) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombres`, `fecha_nacimiento`, `apellidos`, `email`, `password`, `tipo_usuario`, `genero`, `especializacion`, `telefono`, `estado`, `fecha_registro`) VALUES
(1, 'Profesor 1', '1994-04-12', 'UFPS', 'carlostapias@gmail.com', NULL, 'profesor', 'masculino', 'ghhg', '5448745', 'a', '2018-05-18 13:17:17'),
(2, 'Admin', NULL, 'ASPU', 'admin_aspu@ufps.edu.co', '1234', 'admin', 'masculino', 'ghgf', '47598459', 'a', '2018-06-13 02:06:08'),
(3, 'Leonardo ', NULL, 'Amaya', 'usuario_aspu@ufps.edu.co', '1234', 'usuario', 'masculino', 'gfh', '4556776', 'a', '2018-06-14 03:16:06'),
(4, 'Daniel', NULL, 'Garcia', 'danielgarcia@ufps.edu.co', '1234', 'usuario', 'masculino', 'ghh', '5477784', 'a', '2018-05-14 02:16:06'),
(5, 'gjfjgj', NULL, 'gfgf', 'gflkgggf@gfg', 'dfggfggf', 'usuario', 'masculino', 'jklgjfgjgf', NULL, 'a', '2018-06-16 00:32:13'),
(6, 'Victor', NULL, 'Marcelo', 'victor@ufps.edu.co', '1234', 'usuario', 'masculino', 'hgghf', NULL, 'a', NULL),
(7, 'gjfjgj', NULL, 'gfgf', 'gflkgggf@gfg', 'dfggfggf', 'usuario', 'masculino', 'jklgjfgjgf', NULL, 'a', '2018-06-16 01:20:54'),
(8, 'Profesor 2', NULL, 'UFPS', 'jgfjg@hgnm.com', NULL, 'profesor', 'masculino', 'gfhg', 'hhfh', 'a', '2018-06-16 12:29:18'),
(9, 'Profesor 3', '2018-06-13', 'UFPS', 'cbvvbcvbcv@fggghhh', NULL, 'profesor', 'masculino', NULL, 'vcbcbb', 'a', '2018-06-17 21:44:52'),
(10, 'Rene', '1990-12-13', 'Carlos', 'carlos@gmail.com', NULL, 'profesor', 'maculino', 'Web', '455234', 'a', '2018-06-27 09:05:53');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comentario_usuario_idx` (`usuario`),
  ADD KEY `fk_comentario_publicacion1_idx` (`publicacion`);

--
-- Indices de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_publicacion_usuario1_idx` (`usuario`),
  ADD KEY `fk_publicacion_categoria1_idx` (`categoria`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `publicacion`
--
ALTER TABLE `publicacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_comentario_publicacion1` FOREIGN KEY (`publicacion`) REFERENCES `publicacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comentario_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `publicacion`
--
ALTER TABLE `publicacion`
  ADD CONSTRAINT `fk_publicacion_categoria1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_publicacion_usuario1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
