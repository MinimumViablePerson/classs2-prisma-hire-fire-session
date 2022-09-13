import express from 'express'
import cors from 'cors'
import { PrismaClient } from '@prisma/client'

const app = express()
app.use(cors())
app.use(express.json())

const prisma = new PrismaClient()

const port = 5678

app.get('/employees', async (req, res) => {
  const employees = await prisma.employee.findMany({
    include: { interviews: { include: { interviewee: true } }, company: true }
  })
  res.send(employees)
})

app.post('/hire', async (req, res) => {
  const interviewee = await prisma.interviewee.findUnique({
    where: { email: req.body.intervieweeEmail }
  })

  if (interviewee) {
    const employee = await prisma.employee.create({
      data: {
        email: interviewee.email,
        name: interviewee.name,
        role: req.body.role,
        company: {
          connect: {
            name: req.body.companyName
          }
        }
      }
    })
    res.send(employee)
  } else {
    res.status(404).send({ error: 'Interviewee not found.' })
  }
})

app.delete('/fire/:email', async (req, res) => {
  await prisma.employee.delete({
    where: { email: req.params.email }
  })

  res.send({ message: `${req.params.email} has been FIIIIREEED!!!!` })
})

app.get('/companies', async (req, res) => {
  const employees = await prisma.company.findMany({
    include: { employees: true }
  })
  res.send(employees)
})

app.get('/interviewees', async (req, res) => {
  const interviewees = await prisma.interviewee.findMany({
    include: { interviews: { include: { interviewer: true } } }
  })
  res.send(interviewees)
})

app.listen(port, () => {
  console.log(`App running: http://localhost:${port}`)
})
