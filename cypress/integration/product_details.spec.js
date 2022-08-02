describe('product details page', ()=>{
  beforeEach(()=>{
    cy.visit('/')
  })
  it('should visit the home page then go to the details of the first product.', ()=>{
    cy.get('.products article').first().click()
    cy.get('.product-detail').should('exist')
  })

  it('should visit the home page then go to the details of the second product', ()=>{
    cy.get('.products article').eq(1).click()
    cy.get('.product-detail').should('exist')
  })

})