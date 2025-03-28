-- Configuração inicial do banco de dados
CREATE TABLE events (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    title TEXT NOT NULL,
    location TEXT NOT NULL,
    address TEXT NOT NULL,
    time TEXT NOT NULL,
    info TEXT,
    image_url TEXT NOT NULL,
    video_url TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

CREATE TABLE contacts (
    id BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    email TEXT NOT NULL,
    message TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL
);

-- Configurar RLS (Row Level Security)
ALTER TABLE events ENABLE ROW LEVEL SECURITY;
ALTER TABLE contacts ENABLE ROW LEVEL SECURITY;

-- Criar políticas de segurança
CREATE POLICY "Eventos são públicos"
    ON events FOR SELECT
    USING (true);

CREATE POLICY "Inserção pública de eventos"
    ON events FOR INSERT
    WITH CHECK (true);

CREATE POLICY "Qualquer um pode enviar contato"
    ON contacts FOR INSERT
    WITH CHECK (true);

-- Inserir dados de exemplo
INSERT INTO events (title, location, address, time, info, image_url) VALUES
('Evento em Brasília', 'Campus Arena da Sara Nossa Terra', 'Quadra 02, Com. 11, Lote 01, Vicente Pires, DF.', '19H', '@copevdf', '/assets/images/nick-brasilia.png'),
('Evento em Goiânia', 'Arena Videira Bueno', 'Av. T-7, 1361, Goiânia, GO.', '19H', '(062) 3251-0505', '/assets/images/nick-goiania.png'),
('Evento em Ponta Grossa', 'Centro de Convenções do Avivamento', 'Av. Maria Rita Perpétuo da Cruz S/N, Ponta Grossa, PR.', '19H', '(042) 3223-7870', '/assets/images/nick-ponta-grossa.png');