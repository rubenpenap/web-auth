import closeWithGrace from 'close-with-grace'
import { passthrough, http } from 'msw'
import { setupServer } from 'msw/node'
import { handlers as resendHandlers } from './resend.ts'

const miscHandlers = [
	process.env.REMIX_DEV_ORIGIN
		? http.post(`${process.env.REMIX_DEV_ORIGIN}ping`, passthrough)
		: null,
].filter(Boolean)

const server = setupServer(...miscHandlers, ...resendHandlers)

console.info('🔶 Mock server installed')
server.listen({ onUnhandledRequest: 'warn' })

closeWithGrace(() => {
	server.close()
})
