# Database Design

## Business Rules

```
1. A client can have one or more accounts.
2. An account can belong to one or more clients.
3. A client can have one or more physical addresses.
4. A physical address can belong to one or more clients.
5. An account can have one or more cards.
6. A card can belong to one or more accounts.
```

---

## Entities & Attributes

```
Entity: Client
    Attributes:
        - First name
        - Middle name
        - Last name
        - Date of birth
        - Gender
        - Nationality
        - Identification number
        - Phone number
        - Email address
        - Physical address ID
        - Mobile app password

Entity: Client_Address
    Attributes:
        - Client ID
        - Physical address ID

Entity: Physical Address
    Attributes:
        - Address Id
        - Street number
        - Street name
        - Suburb
        - Town
        - Province
        - Postal code
        - Country

Entity: Account_Holder
    Attributes:
        - Client ID
        - Account number
        - Card number
        - Last access date
        - Last deposit date
        - Last withdrawal date        

Entity: Account
    Attributes:
        - Account number
        - Account type (savings/cheque/credit/business)
        - Branch code
        - Account status (active/blocked)

Entiry: Card
    Attributes:
        - Card number
        - Card pin
        - Card type (debit/credit/prepaid)
        - Card network/provider (Visa / Mastercard)
        - Issuing bank
        - Expiry date
        - Card status (active/blocked/expired)
        - Card verification value (CVV)
```

---

## Entity Relationships

```
1. A CLIENT can have one or more accounts; an ACCOUNT can belong to one or more clients. [M:N]
    - Entities:
        - Client
        - Account
    - Bridge Entity:
        - Account_Holder

2. A CLIENT can have one or more physical addresses; a PHYSICAL ADDRESS can belong to one or more clients. [M:N]
    - Entities:
        - Client
        - Physical_Address
    - Bridge Entity:
        - Client_Address

3. An ACCOUNT can have one or more cards; a CARD can belong to one or more accounts. [M:N]
    - Entities:
        - Account
        - Card
    - Bridge Entity:
        - Account_Holder
```

---