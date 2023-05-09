it("There is products on the page", () => {
  cy.visit("/");
  cy.get(".products article").should("have.length", 2);
});
