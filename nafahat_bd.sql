-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 19 juil. 2026 à 16:36
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nafahat_bd`
--

-- --------------------------------------------------------

--
-- Structure de la table `acces_adherent`
--

CREATE TABLE `acces_adherent` (
  `id` int(11) NOT NULL COMMENT 'Identifiant unique interne',
  `adherent_id` int(11) NOT NULL COMMENT 'Référence vers l''adhérent (clé étrangère)',
  `nom_prenom` varchar(255) NOT NULL COMMENT 'Nom et prénom de l''adhérent',
  `whatsapp` varchar(20) NOT NULL COMMENT 'Numéro WhatsApp (identifiant de connexion)',
  `mot_de_passe` varchar(100) NOT NULL COMMENT 'Mot de passe généré (format: nafa-{adherent_id})',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Date de création',
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Date de mise à jour'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `acces_adherent`
--

INSERT INTO `acces_adherent` (`id`, `adherent_id`, `nom_prenom`, `whatsapp`, `mot_de_passe`, `created_at`, `updated_at`) VALUES
(1, 8, 'aaa', '+21625357461', 'nafa-8', '2026-06-25 16:01:51', '2026-06-25 16:01:51');

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

CREATE TABLE `adherent` (
  `id` int(11) NOT NULL COMMENT 'Identifiant unique interne',
  `whatsapp` varchar(20) NOT NULL COMMENT 'Numéro WhatsApp (identifiant unique)',
  `nom_prenom` varchar(255) NOT NULL COMMENT 'الاسم واللقب / Nom et prénom',
  `pays` varchar(100) NOT NULL COMMENT 'بلد الإقامة / Pays de résidence',
  `ville` varchar(100) NOT NULL COMMENT 'المدينة / Ville',
  `email` varchar(255) NOT NULL COMMENT 'البريد الإلكتروني / Adresse email',
  `date_naissance` date NOT NULL COMMENT 'تاريخ الولادة / Date de naissance',
  `genre` enum('homme','femme') NOT NULL COMMENT 'الجنس / Genre',
  `source_connaissance` enum('instagram','facebook','ami','annonce','autre') NOT NULL COMMENT 'كيف تعرفت / Source de connaissance',
  `source_autre_detail` text DEFAULT NULL COMMENT 'Si "autre" est choisi, précision du texte',
  `objectif` text DEFAULT NULL COMMENT 'ما هو هدفك من الالتحاق بهذه الدورات / Objectif personnel',
  `suggestions` text DEFAULT NULL COMMENT 'اقتراحات دورات و مواضيع دروس / Suggestions de cours',
  `accord_publication` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'أوافق على نشر المحتوى / Accepte la publication (1=Oui, 0=Non)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Date et heure d''inscription'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adherent`
--

INSERT INTO `adherent` (`id`, `whatsapp`, `nom_prenom`, `pays`, `ville`, `email`, `date_naissance`, `genre`, `source_connaissance`, `source_autre_detail`, `objectif`, `suggestions`, `accord_publication`, `created_at`) VALUES
(8, '+21625357461', 'aaa', 'aaa', 'aaaa', 'aymenwacheh@gmail.com', '2026-06-25', 'homme', 'instagram', NULL, 'rrrrrrrrrr', 'rrrrrrrrrr', 1, '2026-06-25 16:01:51');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `categorie_fr` varchar(100) NOT NULL,
  `categorie_ar` varchar(100) NOT NULL,
  `ch1` varchar(255) DEFAULT NULL,
  `ch2` varchar(255) DEFAULT NULL,
  `ch3` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `categorie_fr`, `categorie_ar`, `ch1`, `ch2`, `ch3`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'Informatique & Tech', 'تكنولوجيا المعلومات', NULL, NULL, NULL, '2026-06-15 15:46:11', '2026-06-15 15:46:11', NULL),
(2, 'Management & Leadership', 'الإدارة والقيادة', NULL, NULL, NULL, '2026-06-15 15:46:11', '2026-06-15 15:46:11', NULL),
(3, 'Design & Créativité', 'التصميم والإبداع', NULL, NULL, NULL, '2026-06-15 15:46:11', '2026-06-15 15:46:11', NULL),
(4, 'Langues & Communication', 'اللغات والتواصل', NULL, NULL, NULL, '2026-06-15 15:46:11', '2026-06-15 15:46:11', NULL),
(5, 'Informatique & Tech', 'تكنولوجيا المعلومات', NULL, NULL, NULL, '2026-06-15 15:47:41', '2026-06-15 15:47:41', NULL),
(6, 'Management & Leadership', 'الإدارة والقيادة', NULL, NULL, NULL, '2026-06-15 15:47:41', '2026-06-15 15:47:41', NULL),
(7, 'Design & Créativité', 'التصميم والإبداع', NULL, NULL, NULL, '2026-06-15 15:47:41', '2026-06-15 15:47:41', NULL),
(8, 'Langues & Communication', 'اللغات والتواصل', NULL, NULL, NULL, '2026-06-15 15:47:41', '2026-06-15 15:47:41', NULL),
(9, 'tilawasdfgdf', 'sdfgsdftilawa arab', NULL, NULL, NULL, '2026-06-16 11:37:50', '2026-06-22 13:48:14', NULL),
(10, 'eeeee', 'eeeeeeeee', 'e', 'e', 'e', '2026-06-23 07:39:49', '2026-06-23 07:39:49', NULL),
(11, 'AZER', 'AZER', 'AA', 'AA', 'AA', '2026-06-24 14:16:19', '2026-06-24 14:16:19', NULL),
(12, 'frrrf', 'frrrf', NULL, NULL, NULL, '2026-06-29 14:26:31', '2026-06-29 14:26:31', NULL),
(13, 'jjjjj', 'jjjjjjjjjjj', NULL, NULL, NULL, '2026-07-01 11:16:54', '2026-07-01 11:16:54', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `chatbot_categories`
--

CREATE TABLE `chatbot_categories` (
  `id` int(11) NOT NULL,
  `nom_fr` varchar(100) NOT NULL,
  `nom_ar` varchar(100) NOT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chatbot_categories`
--

INSERT INTO `chatbot_categories` (`id`, `nom_fr`, `nom_ar`, `active`, `created_at`) VALUES
(1, 'Formations', 'التكوينات', 1, '2026-06-30 13:07:38'),
(2, 'Prix', 'الأسعار', 1, '2026-06-30 13:07:38'),
(3, 'Inscription', 'التسجيل', 1, '2026-06-30 13:07:38'),
(4, 'Contact', 'الاتصال', 1, '2026-06-30 13:07:38'),
(5, 'Formateurs', 'المؤطرين', 1, '2026-06-30 13:07:38'),
(6, 'Général', 'عام', 1, '2026-06-30 13:07:38');

-- --------------------------------------------------------

--
-- Structure de la table `chatbot_qa`
--

CREATE TABLE `chatbot_qa` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `question_fr` varchar(255) NOT NULL,
  `question_ar` varchar(255) NOT NULL,
  `reponse_fr` text NOT NULL,
  `reponse_ar` text NOT NULL,
  `keywords` text DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chatbot_qa`
--

INSERT INTO `chatbot_qa` (`id`, `category_id`, `question_fr`, `question_ar`, `reponse_fr`, `reponse_ar`, `keywords`, `active`, `created_at`) VALUES
(1, 1, 'Quelles formations proposez-vous ?', 'ما هي التكوينات التي تقدمونها؟', 'Nous proposons des formations en Informatique, Management, Langues, Design, et bien plus. Consultez notre page Formations pour découvrir toutes nos offres !', 'نقدم تكوينات في الإعلامية، التسيير، اللغات، التصميم، والمزيد. زوروا صفحة التكوينات لاكتشاف جميع عروضنا !', 'formations, cours, stages, apprendre, programme', 1, '2026-06-30 13:07:38'),
(2, 1, 'Comment choisir ma formation ?', 'كيف أختار تكويني؟', 'Vous pouvez consulter notre catalogue, lire les descriptions détaillées ou contacter nos conseillers pour vous orienter vers la formation qui vous correspond le mieux.', 'يمكنكم الاطلاع على الكتالوج، قراءة الوصف المفصل أو الاتصال بمستشارينا لتوجيهكم نحو التكوين الأنسب لكم.', 'choisir, sélectionner, décider, orientation, conseil', 1, '2026-06-30 13:07:38'),
(3, 2, 'Quels sont les prix des formations ?', 'ما هي أسعار التكوينات؟', 'Les prix varient selon la formation et sa durée. Consultez notre page dédiée pour plus de détails ou contactez-nous pour un devis personnalisé.', 'تختلف الأسعار حسب التكوين ومدته. زوروا الصفحة المخصصة للمزيد من التفاصيل أو اتصلوا بنا للحصول على عرض سعر مخصص.', 'prix, tarif, coût, combien, paiement', 1, '2026-06-30 13:07:38'),
(4, 3, 'Comment puis-je m\'inscrire ?', 'كيف يمكنني التسجيل؟', 'Pour vous inscrire :\n1. Choisissez votre formation\n2. Cliquez sur \"S\'inscrire\"\n3. Remplissez le formulaire\n4. Confirmation par email\n\nC\'est simple et rapide !', 'للتسجيل :\n1. اختر تكوينك\n2. اضغط على \"سجل\"\n3. املأ الاستمارة\n4. تأكيد عبر البريد الإلكتروني\n\nالأمر بسيط وسريع !', 'inscription, s inscrire, comment, formulaire, enregistrement', 1, '2026-06-30 13:07:38'),
(5, 4, 'Comment vous contacter ?', 'كيف نتواصل معكم؟', '📧 Email : contact@nafahat.com\n📞 Téléphone : +216 XX XXX XXX\n📍 Adresse : Tunis, Tunisie\n\nNous sommes disponibles du lundi au vendredi de 9h à 18h.', '📧 البريد الإلكتروني : contact@nafahat.com\n📞 الهاتف : +216 XX XXX XXX\n📍 العنوان : تونس، تونس\n\nنحن متاحون من الاثنين إلى الجمعة من 9 صباحاً إلى 6 مساءً.', 'contact, contacter, email, téléphone, phone, adresse', 1, '2026-06-30 13:07:38'),
(6, 5, 'Qui sont vos formateurs ?', 'من هم مؤطريكم؟', 'Nos formateurs sont des experts certifiés dans leurs domaines avec plusieurs années d\'expérience professionnelle et pédagogique.', 'مؤطرونا هم خبراء معتمدون في مجالاتهم ولديهم سنوات من الخبرة المهنية والتربوية.', 'formateur, professeur, enseignant, expert, compétence', 1, '2026-06-30 13:07:38'),
(7, 6, 'Bonjour', 'مرحبا', 'Bonjour ! Comment puis-je vous aider aujourd\'hui ? N\'hésitez pas à me poser vos questions sur nos formations, tarifs, inscriptions...', 'مرحباً ! كيف يمكنني مساعدتك اليوم ؟ لا تتردد في طرح أسئلتك حول تكويناتنا، أسعارنا، التسجيل...', 'bonjour, salut, hello, hi, coucou', 1, '2026-06-30 13:07:38'),
(8, 6, 'Merci', 'شكرا', 'Je vous en prie ! C\'est un plaisir de vous aider. N\'hésitez pas si vous avez d\'autres questions. 😊', 'عفواً ! من دواعي سروري مساعدتك. لا تتردد إذا كانت لديك أسئلة أخرى. 😊', 'merci, thanks, شكرا, merci beaucoup', 1, '2026-06-30 13:07:38');

-- --------------------------------------------------------

--
-- Structure de la table `duree`
--

CREATE TABLE `duree` (
  `id` int(11) NOT NULL,
  `type_duree` varchar(100) NOT NULL,
  `ch1` varchar(255) DEFAULT NULL,
  `ch2` varchar(255) DEFAULT NULL,
  `ch3` varchar(255) DEFAULT NULL,
  `ch4` varchar(255) DEFAULT NULL,
  `ch5` varchar(255) DEFAULT NULL,
  `ch6` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `duree`
--

INSERT INTO `duree` (`id`, `type_duree`, `ch1`, `ch2`, `ch3`, `ch4`, `ch5`, `ch6`, `created_at`, `updated_at`) VALUES
(1, 'دورة مكثفة', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-29 14:51:57', '2026-06-29 14:52:33'),
(2, 'دورة أسبوعية', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-29 14:52:11', '2026-06-29 14:52:37'),
(3, 'دورة مسجلة', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-29 14:52:24', '2026-06-29 14:52:41'),
(10, '33', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-01 12:03:58', '2026-07-01 12:03:58');

-- --------------------------------------------------------

--
-- Structure de la table `enfant`
--

CREATE TABLE `enfant` (
  `id` int(11) NOT NULL COMMENT 'Identifiant unique interne',
  `adherent_id` int(11) NOT NULL COMMENT 'Référence vers le parent (clé étrangère)',
  `nom_prenom` varchar(255) NOT NULL COMMENT 'الاسم واللقب / Nom et prénom de l''enfant',
  `date_naissance` date NOT NULL COMMENT 'تاريخ الولادة / Date de naissance de l''enfant',
  `genre` enum('homme','femme') NOT NULL COMMENT 'الجنس / Genre de l''enfant',
  `niveau_tilawa` enum('debutant','quelques_sourates','avance') NOT NULL COMMENT 'مستوى تلاوة الطفل / Niveau de récitation',
  `memorisation` varchar(50) DEFAULT NULL COMMENT 'كم يحفظ (juz_amma, plus_5_hizbs, autre)',
  `memorisation_autre_detail` text DEFAULT NULL COMMENT 'Si "autre" est choisi dans la mémorisation',
  `objectif` text DEFAULT NULL COMMENT 'ما هو هدفك من التحاق طفلك / Objectif pour l''enfant',
  `accord_inscription` tinyint(1) DEFAULT NULL COMMENT 'Accord spécifique pour l''enfant (case Oui/Non)',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Date d''ajout de l''enfant'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formateur`
--

CREATE TABLE `formateur` (
  `id` int(11) NOT NULL,
  `nom_prenom_fr` varchar(150) NOT NULL,
  `nom_prenom_ar` varchar(150) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `bio_fr` text DEFAULT NULL,
  `bio_ar` text DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `nbrSess` int(255) DEFAULT NULL,
  `pay` varchar(255) DEFAULT NULL,
  `ch3` text DEFAULT NULL,
  `ch4` text DEFAULT NULL,
  `ch5` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `formateur`
--

INSERT INTO `formateur` (`id`, `nom_prenom_fr`, `nom_prenom_ar`, `email`, `telephone`, `bio_fr`, `bio_ar`, `id_categorie`, `photo`, `nbrSess`, `pay`, `ch3`, `ch4`, `ch5`, `created_at`, `updated_at`) VALUES
(1, 'Jean Dupont', 'جان دوبون', 'jean.dupont@nafahat.com', '0612345678', 'Expert en développement mobile avec plus de 10 ans d\'expérience chez Google.', 'خبير في تطوير التطبيقات المحمول مع أكثر من 10 سنوات من الخبرة في جوجل.', 1, 'jean_dupont.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-15 15:46:11', '2026-06-15 15:46:11'),
(2, 'Sarah Martin', 'سارة مارتان', 'sarah.martin@nafahat.com', '0623456789', 'Formatrice certifiée en IA et Machine Learning, docteure en informatique.', 'مدربة معتمدة في الذكاء الاصطناعي وتعلم الآلة، دكتورة في علوم الحاسوب.', 1, 'sarah_martin.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-15 15:46:11', '2026-06-15 15:46:11'),
(3, 'Ahmed Benali', 'أحمد بن علي', 'ahmed.benali@nafahat.com', '0634567890', 'Consultant en management stratégique avec 15 ans d\'expérience internationale.', 'استشاري في الإدارة الاستراتيجية مع 15 سنة من الخبرة الدولية.', 2, 'ahmed_benali.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-15 15:46:11', '2026-06-15 15:46:11'),
(4, 'Sophie Bernard', 'صوفي برنار', 'sophie.bernard@nafahat.com', '0645678901', 'Designer UI/UX primée, ancienne designer chez Apple.', 'مصممة UI/UX حاصلة على جوائز، مصممة سابقة في آبل.', 3, 'sophie_bernard.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-15 15:46:11', '2026-06-15 15:46:11'),
(5, 'Karim El Fassi', 'كريم الفاسي', 'karim.elfassi@nafahat.com', '0656789012', 'Spécialiste en formation linguistique et communication interculturelle.', 'متخصص في تكوين اللغات والتواصل بين الثقافات.', 4, 'karim_elfassi.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-15 15:46:11', '2026-06-15 15:46:11'),
(6, 'Jean Dupont', 'جان دوبون', 'jean.dupont@nafahat.com', '0612345678', 'Expert en développement mobile avec plus de 10 ans d\'expérience chez Google.', 'خبير في تطوير التطبيقات المحمول مع أكثر من 10 سنوات من الخبرة في جوجل.', 1, 'jean_dupont.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-15 15:47:42', '2026-06-15 15:47:42'),
(7, 'Sarah Martin', 'سارة مارتان', 'sarah.martin@nafahat.com', '0623456789', 'Formatrice certifiée en IA et Machine Learning, docteure en informatique.', 'مدربة معتمدة في الذكاء الاصطناعي وتعلم الآلة، دكتورة في علوم الحاسوب.', 1, 'sarah_martin.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-15 15:47:42', '2026-06-15 15:47:42'),
(8, 'Ahmed Benali', 'أحمد بن علي', 'ahmed.benali@nafahat.com', '0634567890', 'Consultant en management stratégique avec 15 ans d\'expérience internationale.', 'استشاري في الإدارة الاستراتيجية مع 15 سنة من الخبرة الدولية.', 2, 'ahmed_benali.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-15 15:47:42', '2026-06-15 15:47:42'),
(9, 'Sophie Bernard', 'صوفي برنار', 'sophie.bernard@nafahat.com', '0645678901', 'Designer UI/UX primée, ancienne designer chez Apple.', 'مصممة UI/UX حاصلة على جوائز، مصممة سابقة في آبل.', 3, 'sophie_bernard.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-15 15:47:42', '2026-06-15 15:47:42'),
(10, 'Karim El Fassi', 'كريم الفاسي', 'karim.elfassi@nafahat.com', '0656789012', 'Spécialiste en formation linguistique et communication interculturelle.', 'متخصص في تكوين اللغات والتواصل بين الثقافات.', 4, 'karim_elfassi.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-15 15:47:42', '2026-06-15 15:47:42'),
(11, 'chikh bilel neb mahmoud', 'chikh bilel neb mahmoud', 'bilel@gmail.com', '98987654', '', '', 9, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-16 11:39:36', '2026-06-16 11:39:36'),
(12, 'fghj', 'fgj', 'fghjfghj', '216546', 'fghjfghj', 'fghjfghj', 2, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-22 14:21:52', '2026-06-22 14:21:52'),
(13, 'tt', 'tt', 'tt', '25366987', 'tttt', 'ttt', 7, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-29 11:12:36', '2026-06-29 11:12:36'),
(14, 'zzzzzzzzzzzzz', 'zzzzzzzzzzz', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-01 11:45:38', '2026-07-01 11:45:38');

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

CREATE TABLE `formation` (
  `id` int(11) NOT NULL,
  `titre_fr` varchar(200) NOT NULL,
  `titre_ar` varchar(200) NOT NULL,
  `id_type_formation` int(11) NOT NULL,
  `cible_fr` varchar(255) NOT NULL,
  `cible_ar` varchar(255) NOT NULL,
  `id_duree` int(11) NOT NULL,
  `periode` varchar(100) NOT NULL,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `prix` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` enum('oui','non') DEFAULT 'non',
  `valeur_disc` decimal(10,2) DEFAULT NULL,
  `descri_fr` text NOT NULL,
  `descri_ar` text NOT NULL,
  `id_categorie` int(11) DEFAULT NULL,
  `id_formateur` int(11) DEFAULT NULL,
  `actif` enum('oui','non') DEFAULT 'oui',
  `photo` varchar(255) DEFAULT NULL,
  `ch1` int(11) DEFAULT NULL,
  `ch2` varchar(255) DEFAULT NULL,
  `ch3` text DEFAULT NULL,
  `ch4` text DEFAULT NULL,
  `ch5` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nbr_heur` int(11) DEFAULT 0,
  `nbr_seance` int(11) DEFAULT 0,
  `nbr_jour` int(11) DEFAULT 0,
  `repetitive` enum('oui','non') DEFAULT 'non',
  `jour_semaine` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`jour_semaine`)),
  `afficher_duree` tinyint(1) DEFAULT 1,
  `afficher_periode` tinyint(1) DEFAULT 1,
  `afficher_cible` tinyint(1) DEFAULT 1,
  `afficher_prix` tinyint(1) DEFAULT 1,
  `afficher_formateur` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `formation`
--

INSERT INTO `formation` (`id`, `titre_fr`, `titre_ar`, `id_type_formation`, `cible_fr`, `cible_ar`, `id_duree`, `periode`, `date_debut`, `date_fin`, `prix`, `discount`, `valeur_disc`, `descri_fr`, `descri_ar`, `id_categorie`, `id_formateur`, `actif`, `photo`, `ch1`, `ch2`, `ch3`, `ch4`, `ch5`, `created_at`, `updated_at`, `nbr_heur`, `nbr_seance`, `nbr_jour`, `repetitive`, `jour_semaine`, `afficher_duree`, `afficher_periode`, `afficher_cible`, `afficher_prix`, `afficher_formateur`) VALUES
(15, 'qscsqdc', 'qscqc', 0, 'zszxzec', 'zszxzec', 2, '12 23', NULL, NULL, 222.00, 'oui', 10.00, 'qscqsdc', 'qsdcqsdc', NULL, NULL, 'oui', 'C:\\Users\\douane\\nafahat\\assets\\images\\card4.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-16 10:43:55', '2026-06-16 17:24:55', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(16, 'Tilawa', 'Tilawa arab', 0, 'Debutant', 'Debutant', 4, '15 june 6 6 june', NULL, NULL, 2500.00, 'oui', 10.00, 'Tilawa  Tilawa Tilawa Tilawa Tilawa Tilawa ', 'Tilawa arab', NULL, NULL, 'oui', 'C:\\Users\\douane\\nafahat\\assets\\images\\card3.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-16 11:05:34', '2026-06-16 11:05:34', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(17, 'zedze', 'zedzedz', 0, 'zzeze', 'zzeze', 3, '23', NULL, NULL, 233.00, 'oui', 11.00, 'mk,ok,p,o', 'zedzed', 9, 11, 'oui', 'C:\\Users\\douane\\nafahat\\assets\\images\\card6.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-16 11:45:51', '2026-06-16 17:23:47', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(18, 'qsdqsd', 'qsdqsd', 0, 'qsdsd', 'qsdsd', 0, 'qsdqsd', NULL, NULL, 222.00, 'oui', 33.00, 'qsdqsd', 'qsdd', 3, 4, 'oui', 'C:\\Users\\douane\\nafahat\\assets\\images\\card2.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-16 16:16:07', '2026-06-16 17:18:40', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(19, 'Nouvelle formation ', 'دورة تجويد جديدة', 0, 'Débutant', 'Débutant', 10, '01 jan - 10 octobre', NULL, NULL, 3000.00, 'oui', 20.00, 'nouvelle et nouvelle description francais', 'هذه الدورة لفائدتكم', 9, 11, 'oui', 'C:\\Users\\douane\\nafahat\\assets\\images\\card6.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-17 09:36:54', '2026-06-17 09:36:54', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(20, 'vdfza', 'aadcdc', 0, 'dfvzevf', 'dfvzevf', 4, '44', NULL, NULL, 2020.00, 'non', NULL, 'azdcvaevzaev', 'avdeverv', 4, 5, 'oui', 'https://picsum.photos/800/450?random=1781689062087', NULL, NULL, NULL, NULL, NULL, '2026-06-17 09:37:42', '2026-06-17 09:37:42', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(21, 'azeza1111', 'aerfezaraerfaezr', 0, '5555', '5555', 55, '555', NULL, NULL, 5555.00, 'non', NULL, 'aefaer', 'aerfaerf', 2, 10, 'oui', 'C:\\Users\\douane\\nafahat\\assets\\images\\card5.jfif', NULL, NULL, NULL, NULL, NULL, '2026-06-17 09:38:44', '2026-06-19 11:21:04', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(22, 'dfgbdfg', 'dfghfdgh', 0, 'sdfv', 'sdfv', 0, 'sdfv', NULL, NULL, 987987.00, 'non', NULL, 'sdfsdf', 'sdfvsdfv', 5, 5, 'oui', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:53:36', '2026-06-22 13:53:36', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(23, 'ooooo', 'oo', 0, 'glkyui', 'glkyui', 10, '20', NULL, NULL, 140.00, 'non', NULL, 'oooo', 'oooo', 8, 6, 'oui', 'C:\\Users\\douane\\nafahat\\assets\\images\\card2.jpg', NULL, NULL, NULL, NULL, NULL, '2026-06-22 14:20:08', '2026-06-22 14:20:08', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(24, '77777777777777', '7777777777', 3, 'grereg', 'grereg', 2, '2026-06-23 - 2026-06-28', '2026-06-23', '2026-06-28', 3625.00, 'non', NULL, 'sdvsdv', 'sdvsdvd', 10, 5, 'oui', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-23 10:19:26', '2026-06-23 10:19:26', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(25, 'FFFFFFFF', 'FFFFFFFFFFF', 3, 'DCZ', 'DCZ', 1, '2026-06-23 - 2026-06-24', '2026-06-23', '2026-06-24', 2222.00, 'non', NULL, 'FFFFFFFFFFF', 'FFFFFFFFFFFFFF', 11, 7, 'oui', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-24 14:32:17', '2026-06-24 14:32:17', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(26, 'gg', 'ggg', 3, 'ggg', 'ggg', 3, '2026-06-30 - 2026-06-28', '2026-06-30', '2026-06-28', 987.00, 'non', NULL, 'gggg', 'ggg', 11, 5, 'oui', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-25 07:35:38', '2026-06-25 07:35:38', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(27, 'tttttt11111111111', 'ttttttttttttttttttttttttttttttttttt', 3, 'zretget', 'zretget', 6, '2026-06-29 - 2026-06-26', '2026-06-29', '2026-06-26', 2500.00, 'non', NULL, 'zgzrtg', 'zgrtg', 12, 10, 'oui', NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-29 14:27:38', '2026-06-29 14:27:56', 0, 0, 0, 'non', NULL, 1, 1, 1, 1, 1),
(28, 'lkj', 'lkj', 3, 'grand', 'grand', 3, '2026-07-02 - 2026-07-31', '2026-07-02', '2026-07-31', 800.00, 'oui', 20.00, 'jhg khgkjhgjhg jhgkjhgjhg fdtdt oiuoiu nlkjkljh gfdgfdg', 'jhg khgkjhgjhg jhgkjhgjhg fdtdt oiuoiu nlkjkljh gfdgfdg', 11, 11, 'oui', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-02 10:37:14', '2026-07-02 10:37:14', 30, 14, 15, 'oui', '[\"mardi\",\"jeudi\",\"samedi\"]', 1, 1, 1, 1, 1),
(29, 'titre francais ', 'titre arabe', 2, 'publique cible', 'publique cible', 2, '2026-07-02 - 2026-07-31', '2026-07-02', '2026-07-31', 15000.00, 'oui', 15.00, 'description francais', 'description arabe', 11, 11, 'oui', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-02 10:47:03', '2026-07-02 10:47:03', 20, 10, 5, 'oui', '[\"lundi\",\"jeudi\",\"dimanche\"]', 0, 0, 0, 0, 0),
(30, 'tartata', 'تراتاتا', 3, 'للكبار', 'للكبار', 1, '2026-07-02 - 2026-07-31', '2026-07-02', '2026-07-31', 69874.00, 'non', NULL, 'Description en francais', 'وصف بالغة بالعربية ', 9, 10, 'oui', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-02 11:43:54', '2026-07-10 17:27:20', 30, 35, 40, 'oui', '[\"lundi\",\"mercredi\",\"vendredi\",\"dimanche\"]', 1, 1, 1, 1, 1),
(31, 'XXXXXXXX', 'xxxxx', 2, 'Tout le monde', 'Tout le monde', 2, '2026-07-10 - 2026-07-31', '2026-07-10', '2026-07-31', 2500.00, 'oui', 20.00, 'description description  description  description description description description description description ', ' descriAr descriAr descriAr descriAr descriAr descriAr descriAr ', 8, 11, 'oui', NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-10 16:56:22', '2026-07-10 20:16:37', 20, 5, 4, 'oui', '[\"lundi\"]', 1, 1, 0, 1, 0),
(32, 'fffffffffff', 'fffffffff', 2, 'ffffffffff', 'ffffffffff', 3, '2026-07-16 - 2026-08-20', '2026-07-16', '2026-08-20', 258.00, 'non', NULL, 'ffffffffffffffff', 'fffffffffffffffffffff', 11, 11, 'oui', 'http://localhost:3000/uploads/formations/formation-1784287695198-983232437.png', NULL, NULL, NULL, NULL, NULL, '2026-07-17 11:29:14', '2026-07-17 11:29:14', 55, 5, 5, 'oui', '[\"jeudi\"]', 1, 1, 1, 1, 1),
(33, 'yuyu', 'yuyu', 2, 'uiuiuiui', 'uiuiuiui', 2, '2026-07-17 - 2026-07-29', '2026-07-17', '2026-07-29', 369.00, 'non', NULL, 'uiuiui', 'uuiui', 11, 11, 'oui', 'http://localhost:3000/uploads/formations/formation-1784288203553-680225949.jpg', NULL, NULL, NULL, NULL, NULL, '2026-07-17 11:36:49', '2026-07-17 11:36:49', 44, 4, 4, 'non', NULL, 1, 1, 1, 1, 1),
(34, 'rrrrrrrrr', 'rrrrrrrrrrr', 2, 'tout le monde', 'tout le monde', 2, '2026-07-15 - 2026-07-25', '2026-07-15', '2026-07-25', 9999.00, 'non', NULL, 'desc', 'desc', 11, 11, 'oui', 'http://localhost:3000/uploads/formations/formation-1784405519711-224518892.jpg', NULL, NULL, NULL, NULL, NULL, '2026-07-18 20:12:24', '2026-07-18 20:12:24', 11, 11, 11, 'oui', '[\"lundi\",\"jeudi\",\"dimanche\"]', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `sous_categorie`
--

CREATE TABLE `sous_categorie` (
  `id` int(11) NOT NULL,
  `nom_fr` varchar(255) NOT NULL,
  `nom_ar` varchar(255) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `ch1` varchar(255) DEFAULT NULL,
  `ch2` varchar(255) DEFAULT NULL,
  `ch3` varchar(255) DEFAULT NULL,
  `ch4` varchar(255) DEFAULT NULL,
  `ch5` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sous_categorie`
--

INSERT INTO `sous_categorie` (`id`, `nom_fr`, `nom_ar`, `id_categorie`, `ch1`, `ch2`, `ch3`, `ch4`, `ch5`, `created_at`, `updated_at`) VALUES
(1, 'zzzzz', 'ffffff', 9, NULL, NULL, NULL, NULL, NULL, '2026-06-19 17:06:50', '2026-06-19 17:06:50'),
(2, 'fghj', 'fghjghj', 3, NULL, NULL, NULL, NULL, NULL, '2026-06-22 13:48:56', '2026-06-22 13:48:56'),
(3, 'sdfv', 'sdfvsdfvsdfvsdfvsdvf', 4, NULL, NULL, NULL, NULL, NULL, '2026-06-22 14:11:35', '2026-06-22 14:11:35'),
(4, 'sdfv', 'sdv', 5, NULL, NULL, NULL, NULL, NULL, '2026-06-22 14:11:46', '2026-06-22 14:11:46'),
(5, 'sdfv', 'sdfv', 7, NULL, NULL, NULL, NULL, NULL, '2026-06-22 14:12:14', '2026-06-22 14:12:14'),
(6, 'ooo', 'oooo', 8, NULL, NULL, NULL, NULL, NULL, '2026-06-22 14:19:09', '2026-06-22 14:19:09'),
(7, 'e1', 'e1', 10, 'e1', 'e1', 'e1', 'e1', 'e1', '2026-06-23 07:40:33', '2026-06-23 07:40:33'),
(8, 'uuu', 'uuuuu', 10, NULL, NULL, NULL, NULL, NULL, '2026-06-23 08:55:21', '2026-06-23 08:55:21'),
(9, 'REZA', 'REZA', 11, 'A', 'A', 'A', 'A', NULL, '2026-06-24 14:16:45', '2026-06-24 14:16:45'),
(10, 'dddd', 'ddddd', 7, NULL, NULL, NULL, NULL, NULL, '2026-06-25 07:41:40', '2026-06-25 07:41:40'),
(11, 'tooo', 'too', 12, NULL, NULL, NULL, NULL, NULL, '2026-06-29 14:26:48', '2026-06-29 14:26:48');

-- --------------------------------------------------------

--
-- Structure de la table `type_formation`
--

CREATE TABLE `type_formation` (
  `id` int(11) NOT NULL,
  `type_formation` varchar(100) NOT NULL,
  `ch1` varchar(255) DEFAULT NULL,
  `ch2` varchar(255) DEFAULT NULL,
  `ch3` varchar(255) DEFAULT NULL,
  `ch4` varchar(255) DEFAULT NULL,
  `ch5` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_formation`
--

INSERT INTO `type_formation` (`id`, `type_formation`, `ch1`, `ch2`, `ch3`, `ch4`, `ch5`, `created_at`, `updated_at`) VALUES
(1, 'Présentiel', NULL, NULL, NULL, NULL, NULL, '2026-06-22 15:20:51', '2026-06-22 15:20:51'),
(2, 'En ligne', NULL, NULL, NULL, NULL, NULL, '2026-06-22 15:20:51', '2026-06-22 15:20:51'),
(3, 'Hybride', NULL, NULL, NULL, NULL, NULL, '2026-06-22 15:20:51', '2026-06-22 15:20:51');

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `title_fr` text NOT NULL,
  `title_ar` text NOT NULL,
  `description_fr` text DEFAULT NULL,
  `description_ar` text DEFAULT NULL,
  `video_id` varchar(100) NOT NULL,
  `thumbnail_url` text DEFAULT NULL,
  `views` int(11) DEFAULT 0,
  `is_active` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `videos`
--

INSERT INTO `videos` (`id`, `title_fr`, `title_ar`, `description_fr`, `description_ar`, `video_id`, `thumbnail_url`, `views`, `is_active`, `created_at`, `updated_at`) VALUES
(3, 'nouvelle video ', 'فيديو توضيحي جديد', 'hhhhhhhhhhhhhhhhhhhhhhhh', 'hhhhhhhhhhhhh', 'aAPV_orKOIE', 'https://img.youtube.com/vi/aAPV_orKOIE/hqdefault.jpg', 9, 1, '2026-06-17 13:30:37', '2026-06-17 13:30:37'),
(4, 'gzergzrg', 'zegze', 'zerg', 'zegzeg', 'RDaAPV_orKOIE', 'https://img.youtube.com/vi/RDaAPV_orKOIE/hqdefault.jpg', 7, 1, '2026-06-17 13:31:16', '2026-06-17 13:31:16'),
(5, 'ergzreg', 'erzgzerg', 'ezrgz', 'zerg', '5ERLbktPwBk', 'https://img.youtube.com/vi/5ERLbktPwBk/hqdefault.jpg', 7, 1, '2026-06-17 13:54:49', '2026-06-17 13:54:49'),
(6, 'qdcqsdc', 'dscsdcs', 'sdcsdc', 'sdcsdc', 'RDjGVFiCf9bm4', 'https://img.youtube.com/vi/RDjGVFiCf9bm4/hqdefault.jpg', 3, 1, '2026-06-17 13:55:30', '2026-06-17 13:55:30'),
(7, 'SDCZD', 'SDCZDZZDZED', 'ZEDZDZECZECZCZ', 'ZCZZEDZD', 'rlqJ5SVk6Cw', 'https://img.youtube.com/vi/rlqJ5SVk6Cw/hqdefault.jpg', 1, 1, '2026-06-17 17:45:06', '2026-06-17 17:45:06'),
(8, 'sdfg', 'sdfg', 'sfgd', 'sdfg', 'sdfg', 'https://img.youtube.com/vi/sdfg/hqdefault.jpg', 0, 1, '2026-06-22 15:48:28', '2026-06-22 15:48:28'),
(9, 'uiuiui', 'uiuiui', 'iiiiiiiiiiiiiiiiiiiii', 'iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii', 'Uy8EliWBuEs', 'https://img.youtube.com/vi/Uy8EliWBuEs/hqdefault.jpg', 1, 1, '2026-06-22 16:21:16', '2026-06-22 16:21:16'),
(10, 'bvjhvjhvjh', 'gfyugfyfyt', 'ghcjgchgf', 'gfjygfjy', '8v-iB7lEw78', 'https://img.youtube.com/vi/8v-iB7lEw78/hqdefault.jpg', 1, 1, '2026-06-22 17:49:04', '2026-06-22 17:49:04'),
(11, 'warda', 'warda', 'warda', 'warda', 'RDF8IWDyyF8Dk&index', 'https://img.youtube.com/vi/RDF8IWDyyF8Dk&index/hqdefault.jpg', 1, 1, '2026-06-23 13:23:48', '2026-06-23 13:23:48'),
(12, 'CQSDC', 'QSDCDQS', 'QSDCSDC', 'QSDCD', 'tfs9gBLEmi4', 'https://img.youtube.com/vi/tfs9gBLEmi4/hqdefault.jpg', 0, 1, '2026-06-24 16:31:33', '2026-06-24 16:31:33');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `v_formations_promo`
-- (Voir ci-dessous la vue réelle)
--
CREATE TABLE `v_formations_promo` (
`id` int(11)
,`titre_fr` varchar(200)
,`titre_ar` varchar(200)
,`prix` decimal(10,2)
,`valeur_disc` decimal(10,2)
,`prix_promo` decimal(11,2)
,`photo` varchar(255)
,`categorie_fr` varchar(100)
);

-- --------------------------------------------------------

--
-- Structure de la vue `v_formations_promo`
--
DROP TABLE IF EXISTS `v_formations_promo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_formations_promo`  AS SELECT `f`.`id` AS `id`, `f`.`titre_fr` AS `titre_fr`, `f`.`titre_ar` AS `titre_ar`, `f`.`prix` AS `prix`, `f`.`valeur_disc` AS `valeur_disc`, `f`.`prix`- `f`.`valeur_disc` AS `prix_promo`, `f`.`photo` AS `photo`, `c`.`categorie_fr` AS `categorie_fr` FROM (`formation` `f` left join `categorie` `c` on(`f`.`id_categorie` = `c`.`id`)) WHERE `f`.`discount` = 'oui' AND `f`.`actif` = 'oui' ORDER BY `f`.`prix`- `f`.`valeur_disc` ASC ;

-- --------------------------------------------------------

--
-- Structure de la vue `v_formation_complete` (CORRIGÉE)
--
DROP TABLE IF EXISTS `v_formation_complete`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_formation_complete`  AS SELECT 
  `f`.`id` AS `id`, 
  `f`.`titre_fr` AS `titre_fr`, 
  `f`.`titre_ar` AS `titre_ar`, 
  `f`.`id_type_formation` AS `type`, 
  `f`.`cible_fr` AS `cible_fr`, 
  `f`.`cible_ar` AS `cible_ar`, 
  `f`.`id_duree` AS `duree`, 
  `f`.`periode` AS `periode`, 
  `f`.`prix` AS `prix`, 
  `f`.`discount` AS `discount`, 
  `f`.`valeur_disc` AS `valeur_disc`, 
  `f`.`descri_fr` AS `descri_fr`, 
  `f`.`descri_ar` AS `descri_ar`, 
  `f`.`id_categorie` AS `id_categorie`, 
  `f`.`id_formateur` AS `id_formateur`, 
  `f`.`actif` AS `actif`, 
  `f`.`photo` AS `photo`, 
  `f`.`ch1` AS `ch1`, 
  `f`.`ch2` AS `ch2`, 
  `f`.`ch3` AS `ch3`, 
  `f`.`ch4` AS `ch4`, 
  `f`.`ch5` AS `ch5`, 
  `f`.`created_at` AS `created_at`, 
  `f`.`updated_at` AS `updated_at`, 
  `c`.`categorie_fr` AS `categorie_fr`, 
  `c`.`categorie_ar` AS `categorie_ar`, 
  `form`.`nom_prenom_fr` AS `formateur_nom_fr`, 
  `form`.`nom_prenom_ar` AS `formateur_nom_ar`, 
  `form`.`email` AS `formateur_email`, 
  `form`.`telephone` AS `formateur_telephone`, 
  `form`.`photo` AS `formateur_photo`, 
  CASE WHEN `f`.`discount` = 'oui' AND `f`.`valeur_disc` IS NOT NULL THEN `f`.`prix` - `f`.`valeur_disc` ELSE `f`.`prix` END AS `prix_final`, 
  CASE WHEN `f`.`discount` = 'oui' AND `f`.`valeur_disc` IS NOT NULL THEN CONCAT('-', `f`.`valeur_disc`, ' DH') ELSE NULL END AS `discount_text` 
FROM (`formation` `f` LEFT JOIN `categorie` `c` ON(`f`.`id_categorie` = `c`.`id`) LEFT JOIN `formateur` `form` ON(`f`.`id_formateur` = `form`.`id`)) 
WHERE `f`.`actif` = 'oui' ;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acces_adherent`
--
ALTER TABLE `acces_adherent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_acces_adherent` (`adherent_id`),
  ADD UNIQUE KEY `unique_acces_whatsapp` (`whatsapp`),
  ADD KEY `idx_acces_adherent_whatsapp` (`whatsapp`),
  ADD KEY `idx_acces_adherent_adherent_id` (`adherent_id`);

--
-- Index pour la table `adherent`
--
ALTER TABLE `adherent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `whatsapp` (`whatsapp`),
  ADD KEY `idx_adherent_whatsapp` (`whatsapp`),
  ADD KEY `idx_adherent_email` (`email`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_categorie_parent` (`parent_id`);

--
-- Index pour la table `chatbot_categories`
--
ALTER TABLE `chatbot_categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chatbot_qa`
--
ALTER TABLE `chatbot_qa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Index pour la table `duree`
--
ALTER TABLE `duree`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `enfant`
--
ALTER TABLE `enfant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_enfant_adherent_id` (`adherent_id`);

--
-- Index pour la table `formateur`
--
ALTER TABLE `formateur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Index pour la table `formation`
--
ALTER TABLE `formation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categorie` (`id_categorie`),
  ADD KEY `id_formateur` (`id_formateur`),
  ADD KEY `idx_actif` (`actif`);

--
-- Index pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_sous_categorie_id_categorie` (`id_categorie`);

--
-- Index pour la table `type_formation`
--
ALTER TABLE `type_formation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `video_id` (`video_id`),
  ADD KEY `idx_videos_active` (`is_active`),
  ADD KEY `idx_videos_created` (`created_at`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acces_adherent`
--
ALTER TABLE `acces_adherent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique interne', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `adherent`
--
ALTER TABLE `adherent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique interne', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `chatbot_categories`
--
ALTER TABLE `chatbot_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `chatbot_qa`
--
ALTER TABLE `chatbot_qa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `duree`
--
ALTER TABLE `duree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `enfant`
--
ALTER TABLE `enfant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identifiant unique interne', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `formateur`
--
ALTER TABLE `formateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `formation`
--
ALTER TABLE `formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `type_formation`
--
ALTER TABLE `type_formation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `acces_adherent`
--
ALTER TABLE `acces_adherent`
  ADD CONSTRAINT `fk_acces_adherent_adherent` FOREIGN KEY (`adherent_id`) REFERENCES `adherent` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categorie` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_categorie_parent` FOREIGN KEY (`parent_id`) REFERENCES `categorie` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `chatbot_qa`
--
ALTER TABLE `chatbot_qa`
  ADD CONSTRAINT `chatbot_qa_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `chatbot_categories` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `enfant`
--
ALTER TABLE `enfant`
  ADD CONSTRAINT `fk_enfant_adherent` FOREIGN KEY (`adherent_id`) REFERENCES `adherent` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `sous_categorie`
--
ALTER TABLE `sous_categorie`
  ADD CONSTRAINT `sous_categorie_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
