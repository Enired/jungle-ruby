describe('testing home page', () => {
  it('visits the home page', () => {
    cy.visit('/');
  });

  it('should have products on the home page', () => {
    cy.get(".products article").should('be.visible');
  });

  it('should show at least 2 products on the home page', () => {
    cy.get(".products article").should('have.length', 2);
  });

});