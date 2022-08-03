describe('testing user login', () => {
  beforeEach(() => {
    cy.request('/cypress_rails_reset_state')
  })

  it('should login after creating an account.', ()=>{
    cy.visit('/')
    cy.get('[href="/signup"]')
      .click()
      .get('#user_first_name')
      .type('Derine')
      .get('#user_last_name')
      .type('Banis')
      .get('#user_email')
      .type('test@test.com')
      .get('#user_password')
      .type('something')
      .get('#user_password_confirmation')
      .type('something')
      .get('[type="submit"]')
      .click()
      .get('.me-auto > :nth-child(2)')
      .should('include.text', "Derine Banis")
  })
});