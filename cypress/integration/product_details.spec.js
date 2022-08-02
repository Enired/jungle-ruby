describe('product details page', ()=>{
  it('should visit the home page then go to the details of the first project.', ()=>{
    cy.visit('/')
    cy.get('.products article').first().click()
    cy.get('.product-detail').should('exist')
  })

})