feature 'User sign in' do

  let!(:user) do
    User.create(email: 'user@example.com', password: 'secret123', password_confirmation: 'secret123' )
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page.status_code).to eq(200)
    expect(page).to have_content("Welcome, #{user.email}")
  end

  scenario 'user can sign in from home page' do
    visit('/')
    click_link 'Login'
    expect(current_path).to eq('/sessions/new')
  end
end