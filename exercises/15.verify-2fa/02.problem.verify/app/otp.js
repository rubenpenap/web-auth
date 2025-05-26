import { generateTOTP } from '@epic-web/totp'

const otpString = `otpauth://totp/localhost%3A6142:kody%40kcd.dev?secret=M3BP7UBSRZOMG744&issuer=localhost%3A6142&algorithm=SHA1&digits=6&period=30`

const otpUri = new URL(otpString)
const { secret, algorithm, digits, period } = Object.fromEntries(
	otpUri.searchParams.entries(),
)

const { otp } = generateTOTP({
	secret,
	algorithm,
	digits,
	period,
})

console.log(otp)
