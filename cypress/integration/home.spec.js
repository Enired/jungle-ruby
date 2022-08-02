describe('testing home page', () => {
  it('visits the home page', () => {
    cy.visit('/');
  });

  it('should have products on the home page', () => {
    cy.get(".products article").should('be.visible');
  });

});