User Management App - Flutter
📋 Descripción
Aplicación móvil desarrollada en Flutter para la gestión de usuarios con formularios multi-paso. Permite crear usuarios con información personal y múltiples direcciones, siguiendo un flujo estructurado de 3 pantallas principales.
Desarrollado como prueba técnica para Double V Partners NYX
✨ Características Principales

Formulario Multi-Paso: Flujo estructurado con indicador visual de progreso
Gestión de Usuarios: Crear, visualizar y eliminar usuarios
Direcciones Múltiples: Cada usuario puede tener múltiples direcciones
Geolocalización: Selección jerárquica de País → Departamento → Municipio
Persistencia Local: Almacenamiento con Hive para datos offline
Estados Reactivos: Manejo de estado con Riverpod
UI Responsiva: Diseño adaptativo con componentes reutilizables
Gestión de Errores: Control robusto de errores y validaciones

🏗️ Arquitectura
Patrón de Arquitectura

Clean Architecture con separación de capas
Atomic Design para componentes UI (Protons, Atoms, Molecules, Organisms)
Provider Pattern con Riverpod para gestión de estado
Service Layer para lógica de negocio

🔄 Flujo de la Aplicación
1. Pantalla Principal (Home)

Lista de usuarios existentes
Estadísticas básicas
FAB para crear nuevo usuario
Opción de eliminar usuarios

2. Formulario de Usuario

Paso 1/3: Información personal (Nombre, Apellido, Fecha de nacimiento)
Validaciones en tiempo real
Indicador visual de progreso

3. Formulario de Direcciones

Paso 2/3: Gestión de direcciones
Selección jerárquica: País → Departamento → Municipio
Múltiples direcciones por usuario
Validaciones geográficas

4. Perfil Completo

Paso 3/3: Resumen y confirmación
Vista completa del usuario
Opción de agregar más direcciones
Finalización del proceso

🛠️ Tecnologías Utilizadas

Gestión de Estado

Riverpod - State management reactivo
Freezed - Generación de modelos inmutables
Json Annotation - Serialización de datos

Almacenamiento

Hive - Base de datos local NoSQL
Hive Flutter - Adaptador para Flutter

Navegación

Go Router - Navegación declarativa
