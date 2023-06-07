# Booking app using Domain Driven Design

## Domain Objects
### Workspace
- ID
- floor
- location (Bern or Schlieren)
#### Room
- capacity (>= 1)
#### Desk
### User
- ID
- name
#### Employer
#### Employee
### Booking
- ID
- workspace
- employees (cannot be more than workspace.capacity)
- start
- end

## Use Cases
### Employer
- Create workspace
- Delete workspace
### Employee
- See available workspaces
- Book workspace

### Next steps
- Implement value objects and entities for domain objects
- Use Email and Password value objects as orientation
- Use UUID for IDs of entities
- Use TimeRange aggregate for start and end