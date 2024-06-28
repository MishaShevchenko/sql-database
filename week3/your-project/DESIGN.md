# Design Document - "Tourism Database"

## Scope

### Purpose

The purpose of this database is to facilitate the management and exploration of tourist attractions, events, cities, and countries, primarily focusing on Belgium and the Netherlands. It aims to provide users with information about attractions and events in these countries, allowing them to make informed decisions about places to visit.

### In Scope

- **Countries:** Represented by unique identifiers and names.
- **Cities:** Linked to countries, where attractions and events are located.
- **Attractions:** Points of interest within cities, each with a unique identifier, name, description, and associated city.
- **Events:** Scheduled events happening in cities, each with a unique identifier, name, description, date, and associated city.
- **Users:** Individuals using the database, identified by unique IDs and usernames.
- **Reviews:** Feedback provided by users on attractions and events, including ratings and comments.

### Out of Scope

- Detailed financial transactions or reservations.
- Real-time availability or booking management.
- Complex analytics beyond basic reporting on reviews and ratings.

## Functional Requirements

### User Actions

Users should be able to:

- Add, update, and delete countries, cities, attractions, events, and user profiles.
- Leave reviews and ratings for attractions and events.
- Query attractions and events based on city, country, ratings, etc.

### Beyond Scope

- Real-time updates of event schedules.
- Integration with payment systems or booking platforms.
- Advanced predictive analytics on tourism trends.

## Entities and Relationships

### Entity Relationship Diagram (ERD)

![ER Diagram](link_to_your_er_diagram_image)

### Relationships

- **Country - City:** One-to-Many relationship where a country can have multiple cities.
- **City - Attraction/Event:** One-to-Many relationships where cities can have multiple attractions and events.
- **User - Review:** One-to-Many relationship where a user can leave multiple reviews.
- **Review - Attraction/Event:** Many-to-One relationships where reviews are associated with either attractions or events.

## Representation

### Entities Chosen

- **Country:** Attributes include `CountryID` (Primary Key) and `Name`.
- **City:** Attributes include `CityID` (Primary Key), `Name`, and `CountryID` (Foreign Key to Country).
- **Attraction:** Attributes include `AttractionID` (Primary Key), `Name`, `Description`, and `CityID` (Foreign Key to City).
- **Event:** Attributes include `EventID` (Primary Key), `Name`, `Description`, `Date`, and `CityID` (Foreign Key to City).
- **User:** Attributes include `UserID` (Primary Key) and `UserName`.
- **Review:** Attributes include `ReviewID` (Primary Key), `UserID` (Foreign Key to User), `AttractionID` (Nullable Foreign Key to Attraction), `EventID` (Nullable Foreign Key to Event), `Rating`, and `Comment`.

### Attribute Types and Constraints

- Used VARCHAR for textual data with specified lengths based on expected content.
- DATE type for event dates.
- FOREIGN KEY constraints to maintain referential integrity between related tables.
- CHECK constraint on `Review` to ensure each review is associated with either an attraction or an event but not both simultaneously.

## Optimizations

### Indexes and Views

- **Indexes:** Created on primary key columns (`CountryID`, `CityID`, `AttractionID`, `EventID`, `UserID`, `ReviewID`) for faster data retrieval.
- **Views:** Created to simplify complex queries for popular tourist destinations or top-rated attractions/events.

## Limitations

### Design Limitations

- Might struggle with representing real-time availability or dynamic pricing.
- Not designed for high-frequency transactional data typical in booking systems.
- Limited to basic reporting and analytics capabilities.

### Representation Challenges

- Complexity in managing large-scale events or attractions with frequent updates.
- Potential performance issues when querying across large datasets due to joins and aggregations.
