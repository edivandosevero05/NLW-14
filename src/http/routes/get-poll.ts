import { FastifyInstance } from "fastify";
import { z } from "zod";
import { prisma } from "../../lib/prisma";

export default function getPoll(app: FastifyInstance) {
  app.get('/polls/:pollId', async (req, res) => {
    const createPollParams = z.object({
      pollId: z.string().uuid()
    })
    const { pollId } = createPollParams.parse(req.body)

    const poll = await prisma.poll.findUnique({
      where: {
        id: pollId
      },
      include: {
        options: {
          select: {
            id: true,
            title: true
          } 
        }
      }
    });
    if(!poll) {
      throw new Error('Poll not found');
    }
    return res.status(200).send({poll});
  })
}