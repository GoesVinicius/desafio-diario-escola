-- 1) Dado o seguinte diagrama elabore as seguintes inserções.

-- a) Pablo é Pai de Lucas
-- b) Brenda é Mãe de Lucas

INSERT INTO Aluno(Nome) VALUES ("Lucas");
SET @IdAluno = LAST_INSERT_ID();
INSERT INTO Responsavel(Nome) VALUES ("Pablo");
SET @IdResponsavel = LAST_INSERT_ID();
INSERT INTO Parentesco(IdResponsavel, IdAluno, Parentesco) VALUES (@IdResponsavel,@IdAluno, "Pai");
INSERT INTO Responsavel(Nome) VALUE ("Brenda");
SET @IdResponsavel = LAST_INSERT_ID();
INSERT INTO Parentesco(IdResponsavel, IdAluno, Parentesco) VALUES (@IdResponsavel,@IdAluno, "Mae");

-- Faça uma consulta que retorne os dados sem repetir igual o exemplo abaixo. Caso o
-- aluno tenha mais de dois responsáveis, traga apenas os mais antigos.

SELECT DISTINCT A.NOME AS Aluno, R.NOME AS Responsavel, P.parentesco
FROM ALUNO AS A
INNER JOIN PARENTESCO AS P 
    ON A.ID = P.IdAluno
INNER JOIN RESPONSAVEL AS R
    ON R.ID = P.IdResponsavel
WHERE P.IdResponsavel IN (
    SELECT P1.IdResponsavel
    FROM PARENTESCO AS P1
    WHERE P1.IdAluno = A.ID
)
GROUP BY A.NOME, R.NOME, P.parentesco
    
-- Bônus:
-- 1) Traga em uma consulta todos os dados. Seja criativo

SELECT a.id AS aluno_id, a.nome AS aluno_nome, r.id AS responsavel_id, r.nome AS responsavel_nome, p.idAluno, p.IdResponsavel, p.parentesco
FROM aluno a
INNER JOIN parentesco p 
    ON a.id = p.idAluno
INNER JOIN responsavel r
    ON r.id = p.idResponsavel