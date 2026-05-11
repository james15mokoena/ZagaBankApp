# Requirements Gathering and Analysis

## Functional Requirements

- User must be able to login.
- User must be able to reset card pin.

---

## Non-Functional Requirements

- Unspecified yet.

---

## User Stories

- As a _user_, I want to be able to __login__, so that I can perform some transaction(s).
- As a _user_, I want to be able to __reset card pin__, so that I can prevent anyone who has the current pin from using it to withdraw my money.

---

## Use Cases

```
Use case: Log in

Actors:
    1. User
```

```
Use case: Reset card pin

Actors:
    1. User
```

---

## Scenarios

```
Scenario: Log in

Preconditions:
    1. User is on the login page.

Steps:
    1. User enters email.
    2. User enters password.
    3. User presses the login button.
    4. System verifies the email and password.
    5. System gives user access to the home page.

Extensions:
    4a. Verification failed
        1. System informs the user that verification failed.
        2. User attempts to login again or exit the system.

Postconditions:
    1. User has successfully logged in.
    1. User is on the home page.
```

```
Scenario: Reset card pin

Preconditions:
    1. User is logged in.
    2. User is on the reset card pin page.

Steps:
    1. User enters previous card pin.
    2. User enters new card pin.
    3. User presses the reset button.
    4. System verifies the previous card pin.
    5. System updates card pin.
    6. System notifies user that card pin is changed.

Extensions:
    4a. Previous card pin is incorrect
        1. System informs user that previous card pin is incorrect.
        2. System sends SMS/email to the user's informing them that card pin reset failed.***
        3. User attempts again to reset card pin or cancels the operation.

Postconditions:
    1. User card pin is reset/changed successfully.
```

---