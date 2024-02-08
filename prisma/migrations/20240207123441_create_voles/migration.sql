-- CreateTable
CREATE TABLE "Vote" (
    "id" SERIAL NOT NULL,
    "seccionId" TEXT NOT NULL,
    "poolOptionId" TEXT NOT NULL,
    "pollId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Vote_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Vote_seccionId_pollId_key" ON "Vote"("seccionId", "pollId");

-- AddForeignKey
ALTER TABLE "Vote" ADD CONSTRAINT "Vote_pollId_fkey" FOREIGN KEY ("pollId") REFERENCES "Poll"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vote" ADD CONSTRAINT "Vote_poolOptionId_fkey" FOREIGN KEY ("poolOptionId") REFERENCES "PoolOption"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
