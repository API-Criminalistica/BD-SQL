# BD-SQL
BASE DE DATOS 

```code 
Localidad (1) ──────── (N) Barrio
    │                      │
    │                      │
    └────── (1) ┌──────────┘
               │
           Ubicacion (1) ────────── (N) Delito
               
                               (N) Delito (N) ─────── (1) TipoDelito
                               
                               (N) Delito (N) ─────── (1) Estado
                               
Persona (1) ─────── (N) Delito
```
| Entidad     | Tabla SQL   | DTOs           |
|------------|------------|----------------|
| Localidad  | Localidad  | LocalidadDTO   |
| Barrio     | Barrio     | BarrioDTO      |
| Ubicacion  | Ubicacion  | UbicacionDTO   |
| TipoDelito | TipoDelito | TipoDelitoDTO  |
| Delito     | Delito     | DelitoDTO      |
| Persona    | Persona    | PersonaDTO     |
