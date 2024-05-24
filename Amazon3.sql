-- Permitir la configuración avanzada
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;

-- Habilitar Agent XPs
EXEC sp_configure 'Agent XPs', 1;
RECONFIGURE;
