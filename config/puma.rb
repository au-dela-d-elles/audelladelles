# Puma peut servir chaque requête dans un thread à partir d'un pool de threads interne.
# Le réglage de la méthode `threads` prend deux nombres : un minimum et un maximum.
# Toutes les bibliothèques qui utilisent des pools de threads doivent être configurées pour correspondre
# à la valeur maximale spécifiée pour Puma. Par défaut, il est configuré pour 5 threads en minimum
# et maximum ; cela correspond à la taille de thread par défaut d'Active Record.
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Spécifie le seuil `worker_timeout` que Puma utilisera pour attendre avant de
# terminer un worker dans les environnements de développement.
#
worker_timeout 3600 if ENV.fetch("RAILS_ENV", "development") == "development"

# Spécifie le `port` sur lequel Puma écoutera pour recevoir les requêtes ; par défaut, c'est 3000.
#
port ENV.fetch("PORT") { 3000 }

# Spécifie l'environnement (`environment`) dans lequel Puma s'exécutera.
#
environment ENV.fetch("RAILS_ENV") { "development" }

# Spécifie le fichier PID (`pidfile`) que Puma utilisera.
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Spécifie le nombre de `workers` à démarrer en mode cluster.
# Les workers sont des processus de serveur Web forkés. Si vous utilisez des threads et des workers ensemble,
# la concurrence de l'application serait max `threads` * `workers`.
# Les workers ne fonctionnent pas sur JRuby ou Windows (qui ne prennent pas en charge les processus).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Utilisez la méthode `preload_app!` lorsque vous spécifiez le nombre de `workers`.
# Cette directive indique à Puma de d'abord démarrer l'application et de charger le code
# avant de bifurquer l'application. Cela profite du comportement de copie à la demande
# du processus pour que les workers utilisent moins de mémoire.
#
# preload_app!

# Autorise Puma à être redémarré par la commande `bin/rails restart`.
plugin :tmp_restart



