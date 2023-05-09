it ("should navigate from the homepage tothe product detail page", () => {
    cy.visit('/')
    cy.get(".products > :nth-child(1) > a").click()
})