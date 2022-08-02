describe('add to cart', ()=>{
  it('should add a product to the cart', ()=>{
    cy.visit('/')
    cy.get('.products article')
      .first()
      .get('.btn')
      .first()
      .click()
      .wait(500)

    cy.get('#navbarSupportedContent')
      .should('include.text', 'My Cart (1)')
  })
})