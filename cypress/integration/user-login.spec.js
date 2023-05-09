describe("authentication", () => {
  before(() => {
    cy.visit("/signup");
    cy.get("#user_first_name").type("John");
    cy.get("#user_last_name").type("Doe");
    cy.get("#user_email").type("test@test.com");
    cy.get("#user_password").type("password");
    cy.get("#user_password_confirmation").type("password");
    cy.get(".btn").contains("Create User").click();
  });

  it("login if correct credentials", () => {
    cy.visit("/login");
    cy.get("#email").type("test@test.com");
    cy.get("#password").type("password");
    cy.get(".btn").contains("Submit").click();
    cy.location('pathname').should('eq', '/')
  });

  it("should not login if incorrect credentials", () => {
    cy.visit("/login");
    cy.get("#email").type("test@test.com");
    cy.get("#password").type("passwor");
    cy.get(".btn").contains("Submit").click();
    cy.location('pathname').should('eq', '/login')
  });
});
