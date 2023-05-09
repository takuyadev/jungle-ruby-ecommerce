it("should add item to cart through product page", () => {
  cy.visit("/");
  cy.get(".products > :nth-child(1) > a").click();
  cy.get(".btn").contains("Add").click();
  cy.get("#navbarSupportedContent a")
    .contains("My Cart")
    .should("contain", "1");
  cy.get("#navbarSupportedContent a").contains("My Cart").click();
  cy.get("table").should("not.be.empty");
});

it("should add item to cart through home page", () => {
  cy.visit("/");
  cy.get(".products > :nth-child(1) button").click({ force: true });
  cy.get("#navbarSupportedContent a")
    .contains("My Cart")
    .should("contain", "1");
  cy.get("#navbarSupportedContent a").contains("My Cart").click();
  cy.get("table").should("not.be.empty");
});

it("should show empty alert message if cart is empty", () => {
  cy.visit("/");
  cy.get("#navbarSupportedContent a").should("contain", "0");
  cy.get("#navbarSupportedContent a").contains("My Cart").click();
  cy.get(".alert").should("have.class", "alert-danger");
});
