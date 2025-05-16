import bcrypt from 'bcryptjs'

export { bcrypt }

const SESSION_EXPIRATION_TIME = 30 * 24 * 60 * 60 * 1000 // 30 days
export function getSessionExpirationDate() {
	return new Date(Date.now() + SESSION_EXPIRATION_TIME)
}
