const {PrismaClient} =require('@prisma/client')
const prisma = new PrismaClient()

async function run() {
  await prisma.$executeRawUnsafe('DROP Database dental-clinic')
  await prisma.$executeRawUnsafe('CREATE Database dental-clinic')
}
console.log('Reset DB')
run()