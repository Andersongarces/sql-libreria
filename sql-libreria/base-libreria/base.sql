-- Active: 1709166971783@@127.0.0.1@3306@libreria
-- Tabla de Autores
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_nacimiento DATE,
    nacionalidad VARCHAR(100)
);

-- Tabla de Géneros
CREATE TABLE generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla de Editoriales
CREATE TABLE editoriales (
    id_editorial INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ubicacion VARCHAR(100)
);

-- Tabla de Libros
CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200),
    id_autor INT,
    id_genero INT,
    id_editorial INT,
    año_publicacion YEAR,
    isbn VARCHAR(20),
    cantidad_disponible INT,
    precio DECIMAL(10, 2),
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
    FOREIGN KEY (id_genero) REFERENCES generos(id_genero),
    FOREIGN KEY (id_editorial) REFERENCES editoriales(id_editorial)
);

-- Tabla de Clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    direccion VARCHAR(200),
    fecha_registro DATE
);

-- Tabla de Transacciones
CREATE TABLE transacciones (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_libro INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    multa DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);



-- Cambiar el tipo de dato de la columna año_publicacion a INT
ALTER TABLE libros MODIFY COLUMN año_publicacion INT;
 
--- Datos para cada tabla 

-- Insertar datos de autores
INSERT INTO autores (nombre, fecha_nacimiento, nacionalidad) VALUES
    ('Gabriel García Márquez', '1927-03-06', 'Colombiana'),
    ('J.K. Rowling', '1965-07-31', 'Británica'),
    ('Stephen King', '1947-09-21', 'Estadounidense'),
    ('Jane Austen', '1775-12-16', 'Británica'),
    ('Haruki Murakami', '1949-01-12', 'Japonesa');

-- Insertar datos de géneros
INSERT INTO generos (nombre) VALUES
    ('Ficción'),
    ('Fantasía'),
    ('Misterio');

-- Insertar datos de editoriales
INSERT INTO editoriales (nombre, ubicacion) VALUES
    ('Penguin Random House', 'Estados Unidos'),
    ('HarperCollins', 'Reino Unido');

-- Insertar datos de libros
INSERT INTO libros (titulo, id_autor, id_genero, id_editorial, año_publicacion, isbn, cantidad_disponible, precio) VALUES
    ('Cien años de soledad', 1, 1, 1, 1967, '9780307350482', 100, 20.50),
    ('Harry Potter y la piedra filosofal', 2, 2, 2, 1997, '9781408855652', 150, 15.75),
    ('It', 3, 3, 1, 1986, '9781444720735', 80, 18.99),
    ('Orgullo y prejuicio', 4, 1, 2, 1813, '9780141439518', 120, 12.30),
    ('Tokio Blues', 5, 1, 1, 1987, '9780676973250', 90, 17.25); 



-- Insertar datos de clientes
INSERT INTO clientes (nombre, email, direccion, fecha_registro) VALUES
    ('Juan Pérez', 'juan@example.com', 'Calle Principal 123', '2022-01-01'),
    ('María García', 'maria@example.com', 'Avenida Central 456', '2022-01-05'),
    ('Pedro López', 'pedro@example.com', 'Plaza Mayor 789', '2022-01-10'),
    ('Laura Martínez', 'laura@example.com', 'Callejón Secreto 321', '2022-01-15'),
    ('Carlos Rodríguez', 'carlos@example.com', 'Paseo del Prado 654', '2022-01-20'),
    ('Ana Sánchez', 'ana@example.com', 'Boulevard Largo 987', '2022-01-25'),
    ('David Fernández', 'david@example.com', 'Carrera Corta 147', '2022-01-30'),
    ('Sofía Pérez', 'sofia@example.com', 'Calle Estrecha 258', '2022-02-01'),
    ('Miguel Gómez', 'miguel@example.com', 'Avenida Ancha 369', '2022-02-05'),
    ('Elena Ruiz', 'elena@example.com', 'Callejuela Angosta 753', '2022-02-10');


    -- Insertar datos de transacciones
INSERT INTO transacciones (id_cliente, id_libro, fecha_prestamo, fecha_devolucion) VALUES
    (1, 1, '2022-02-20', '2022-03-10'),
    (2, 2, '2022-02-21', '2022-03-11'),
    (3, 3, '2022-02-22', '2022-03-12'),
    (4, 4, '2022-02-23', '2022-03-13'),
    (5, 5, '2022-02-24', '2022-03-14'),
    (6, 1, '2022-02-25', '2022-03-15'),
    (7, 2, '2022-02-26', '2022-03-16'),
    (8, 3, '2022-02-27', '2022-03-17'),
    (9, 4, '2022-02-28', '2022-03-18'),
    (10, 5, '2022-03-01', '2022-03-19');

