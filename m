Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 744CDC2418A
	for <lists+drbd-dev@lfdr.de>; Fri, 31 Oct 2025 10:20:39 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 28373162793;
	Fri, 31 Oct 2025 10:20:30 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 427 seconds by postgrey-1.31 at mail19;
	Tue, 21 Oct 2025 15:36:03 CEST
Received: from mail-edgeMUC218.fraunhofer.de (mail-edgemuc218.fraunhofer.de
	[192.102.154.218])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 05B05162267
	for <drbd-dev@lists.linbit.com>; Tue, 21 Oct 2025 15:36:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=aisec.fraunhofer.de; i=@aisec.fraunhofer.de;
	q=dns/txt; s=emailbd1; t=1761053763; x=1792589763;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=OTKPxhZ1hytSbdY5nJbotHq8Hcy/2refIqqh7kWyySg=;
	b=4vLYVbFAdgbzT6A4Lk+QYOU7Pk0XMNEZQvAQ4dkmyo+sSmK6R55WjaD3
	JhfJKRbMyJ5MSh71Or3BMk8ZNqQkHCEc95ETpywQ7eBcTU1+7spqffIBc
	RHXId7LVKz/+sEHFT3VWUt8ZdE8OPR1VxSc26KBz1f/MllZV+HFsrpxSt
	rFJQnWZbyXBXNzGQp1HZESfjrIGY7hEXvcWFbGhhmuhi3VZRi7L30fkq5
	+MZ9hOn6/lSCN39Ntiun1PmiXi3PL2zZgHpHl2BJpbR0kf0DDjhX0tmYA
	YM+tGGsEc2fEuczIUMk6Tl1w7oLgXtXnS242tV5dSqxkw1AcZMXRJDiPA g==;
X-CSE-ConnectionGUID: P2Ig20mCSLSLeA3BBUvfog==
X-CSE-MsgGUID: fdhuGzwCT5CE3NwI7sqCHw==
Authentication-Results: mail-edgeMUC218.fraunhofer.de;
	dkim=pass (signature verified)
	header.i=@fraunhofer.onmicrosoft.com
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2HyAgBMVK1o/xwBYJlagQmBU4JAQAEygUMBAS6EVZFxn?=
	=?us-ascii?q?HKBK4ElA1cPAQEBAQEBAQEBCAFRBAEBAwSEdgqMKSc0CQ4BAQEBAwEBAQEBA?=
	=?us-ascii?q?gUBAQEBAQEBAQEBAQsBAQYBAgEBAQQIAQKBHYYJRg2CYoElgSYBAQEBAQEBA?=
	=?us-ascii?q?QEBAQEdAjV/DwENAQE3ATQCJgIzKw4FgwIBgiQEEgM1uiSBMoEBggwBAQbbK?=
	=?us-ascii?q?RiBJ4EgCQkBgREug3yEVAGEfGcJh0aBSoMzgVKCOE44gw6CRyKDPIQOgiqBY?=
	=?us-ascii?q?ogbiihIgQIcA1ksAVUTDQoLBwWBYwM1DAsuFW4yHYEnhQ6EHytPhQJBWINTJ?=
	=?us-ascii?q?GsPBoEVg2EGgm9AAwsYDUgRLDcUG0MBbgeTd4I9UR8BYS2BMZRmgySwHweCO?=
	=?us-ascii?q?IFnoVcaM4QEk1yTCgEumFiCWKY+AgQCBAUCEAiBaIIWMz6BbQmBQFIZD5Ihu?=
	=?us-ascii?q?jJ2AjoCBwEKAQEDCYI5jzE0gUsBAQ?=
IronPort-PHdr: A9a23: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
	fo930tIR3diHMrF3T4ITkQq
X-Talos-CUID: =?us-ascii?q?9a23=3A4ODWemq+ORdzA2W6Cax5+IjmUfh/U3KHlHL7GGu?=
	=?us-ascii?q?DLWtAE5e/dEGe/6wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AgAtB0g03hCcbFyyI9Kxah0fJijUj7aiuFW8fjr4?=
	=?us-ascii?q?65uKpbgpvGmiGlR+XXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; d="scan'208";a="13486705"
Received: from mail-mtaka28.fraunhofer.de ([153.96.1.28])
	by mail-edgeMUC218.fraunhofer.de with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
	21 Oct 2025 15:28:55 +0200
X-CSE-ConnectionGUID: BZG7xXkUSvqKiLHL8UGEcw==
X-CSE-MsgGUID: h86SxN0NQhS3yOpIJ5Ex7A==
IronPort-SDR: 68f78a96_2wp71s1C7MSv0GSUZJUcKl+l4AoGzJi2QmbvvWqMwVJ8lNA
	pXY72I68RIDxd4O6ecwoDChwaE+gotXOmjUdtKA==
X-IPAS-Result: =?us-ascii?q?A0BrBQCwifdo/3+zYZlaHgEBCxIMQCWBIAuBblJAATJvW?=
	=?us-ascii?q?QEBLoRUg00BAYUsiHiccoJQA1cPAQMBAQEBAQgBUQQBAYR9CoxOJzcGDgECA?=
	=?us-ascii?q?QECAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBAQYFgQ4Thk8Nhl0WEQ8BD?=
	=?us-ascii?q?QEBNwE0AiYCMysOBSKCYAGCJAQSAzYCAgKhPwGBQAKLJYEygQGCDAEBBgQE2?=
	=?us-ascii?q?yIYgSeBIAkJAYESLoN8hFUBhHxnCYdHgUqDM4FSgjiBBoMOgkcigzSGKJE7S?=
	=?us-ascii?q?IECHANZLAFVEw0KCwcFgWMDNQwLKhVuMh2BJ0EYcz1Xg0khaA8GgRODVAaDe?=
	=?us-ascii?q?IVfD4ZXAwsYDUgRLDcUG0MBbgeSRIIKUR8BYS2BMZRmgySwHweCOIFnoVcaM?=
	=?us-ascii?q?4QEk1yTCgEumFiCWKY+AgQCBAUCEAEBBoF+JoFZMz6BbQmBQE8DGQ+OIYQAv?=
	=?us-ascii?q?gtDMwI6AgcBCgEBAwmCOY8xgX0BAQ?=
IronPort-PHdr: A9a23:8xHCDx9ywcN+Pf9uWWy9ngc9DxPPxp3qa1dGopNykalHN7+j9s6/Y
	h+X7qB3gVvATYjXrOhJj+PGvqyzPA5I7cOPqnkfdpxLWRIfz8IQmg0rGsmeDkPnavXtan9yB
	5FZWVto9G28KxIQFtz3elvSpXO/93sVHBD+PhByPeP7BsvZiMHksoL6+8j9eQJN1ha0fb4gF
	wi8rwjaqpszjJB5I6k8jzrl8FBPffhbw38tGUOLkkTZx+KduaBu6T9RvPRzx4tlauDXb684R
	LpXAXEdPmY56dfCmTLDQACMtR5+Gm8WxxwQHRr91C3TBJDIrnDmjOAlyjWjGv3kQK4RBQa/y
	KlNUh7VjHYrNz8b6VyC2akSxKgOngjxjDV9yN7PXLqnEfZQIrrPJeIdaDsZb5gJeCdcLJjma
	KVeHuNGYMsfpZLn+0pWoB6vVA+LD8T18j1ywWPV07wfgs0wSlDg30ssGJEyl0Tk8Im2H40WS
	L3y0azYzDj7aNFV1xvf+JryQzt4hMi1UvFwWM7K621wRlPboGyv9dXGMjOKjMA9oli6tMs4S
	LuFmWJ7kyBLowe/mulzgJHwu6Qp1Aue13hf0dwycI7wWAt6e9miCJxKq2SAOpBrRt93W2hzo
	3VSItwuvJe6eG0P1J0E7kSPLfKdepWO4hXtWfzXLTorzH5mebfqnx+p6gDg0ezzUMCozUxH5
	jRIiNjCt30BllTT58GLR+E7/xKJ1yyGygbT7e9JOwYzk6/aIIQm2bk+itwYtkGrIw==
IronPort-Data: A9a23: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
IronPort-HdrOrdr: A9a23:bUyRoK6vZnyxdOcIPgPXwMDXdLJyesId70hD6qkRc3Fom6mj/K
	qTdZsgpHzJYUkqKRQdcLy7V5VoIkmsl6Kdg7NwAV7KZmCPhILCFuBfBOXZrQEJgUXFmtK13J
	0QF5RDNA==
X-Talos-CUID: 9a23:xZuutW/lva+sUx0lzlCVv2QmNZ81Qn7g92nJAE6cKUI5dZK4QkDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3Ao3gQWQ6phsePkry+jArn/rL2xoxos/qVGGZVt6w?=
	=?us-ascii?q?GgJKVEjRRGWqwnGueF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.19,245,1754949600"; d="scan'208";a="44197023"
Received: from exo-hybrid-bi.ads.fraunhofer.de (HELO smtp.exch.fraunhofer.de)
	([153.97.179.127]) by mail-mtaKA28.fraunhofer.de with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 15:28:54 +0200
Received: from XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) by
	XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.2562.20; Tue, 21 Oct 2025 15:28:53 +0200
Received: from FR4P281CU032.outbound.protection.outlook.com (40.93.78.52) by
	XCH-HYBRID-04.ads.fraunhofer.de (10.225.9.46) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.2562.20 via Frontend Transport; Tue, 21 Oct 2025 15:28:53 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
	b=hdWsvlrLT10fOb2M5Sz8O/5+RUAzfFXZHEWLaEpnuAUGupwCTbRAufUIZxzGRcMiJa1WUmBcaiwdhCagwboAgZR2V8WICbuQEpdCqW31oHo9Tfa5ugY4KFC9nhFsbd8+0UD2OivDNKpiVho0ow0RikX84uXBnmAfsCgv6u7rVTdD2ikWFgYJPVwE1uI2Z+NrhVSQRx7w+B3YbxIK1JoU7T9Wma8+wDQq7ioqbSJinbVELRglMr953oPQI21A0ifpEnlojNdZCE0umRHHakWUYkinyAiImLO7n0B+XWtk4tiPPBMr30KhbPJCIyAFXVE8JBMDLaNW7h9eXuruLk2cqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector10001;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=n0vzPPTA2oQt3tRb0ztQOXzevM4ZuOfNriUl9DhiJqU=;
	b=FwV0WygbUiSuMvgUFery0iQ2lUznDHPBpJ/msyCk/8Y+IneTi6SQ+yCYbY1Q9s+fe+dXvIadhRf2aScKHDMRzj0WBKCJIPOJEdo0U1JWJZ8exQXGYSef0+Dd5aH+s9lFieWaZkiuiCg0V383LtSWG1Toz0QCTVStaCriMOda0uTsw5NhyinyRW/Xg4i4BhCf9YD9ONbriDfM5itxReWSMpBxBeqHh7UeipN3aorbrtFdg+Jjbc49yZBkdryfqsZayx72YlIvt6JKk1iMnRNU4fj/9qWoSqlXIulf1NeJGXHRCSNJJ9G/nfZow6QviGJb23wTLadgCimsxe5wuK99xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=aisec.fraunhofer.de; dmarc=pass action=none
	header.from=aisec.fraunhofer.de; dkim=pass header.d=aisec.fraunhofer.de;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=fraunhofer.onmicrosoft.com; s=selector2-fraunhofer-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=n0vzPPTA2oQt3tRb0ztQOXzevM4ZuOfNriUl9DhiJqU=;
	b=Vr8CAjc8sTSZMdF4qz0YoE90Y60GcuFs2oF9ya/5E/bsr4y0emy9nOcOrPjR/tKfyM9Ay39Nk/do+TOXX44+CBlq5/umxiePoJkfDJxzRYC1MQQg+hAlsJL798vFQW41Kehw2LXyXI3I0u1Bzd4PIRiWx4F7bpQUNTv32J5Ny2o=
Received: from BE1P281MB2180.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:3f::7) by
	BE1P281MB1827.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:35::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.9228.17; Tue, 21 Oct 2025 13:28:51 +0000
Received: from BE1P281MB2180.DEUP281.PROD.OUTLOOK.COM
	([fe80::be8:c7d1:ae7b:4cd6]) by BE1P281MB2180.DEUP281.PROD.OUTLOOK.COM
	([fe80::be8:c7d1:ae7b:4cd6%5]) with mapi id 15.20.9228.016;
	Tue, 21 Oct 2025 13:28:51 +0000
From: =?UTF-8?q?Michael=20Wei=C3=9F?= <michael.weiss@aisec.fraunhofer.de>
To: <michael.weiss@aisec.fraunhofer.de>
Subject: [PATCH] docs: nbd: update default value for ndb max_part to '16'
Date: Tue, 21 Oct 2025 15:28:48 +0200
Message-ID: <20251021132848.371792-1-michael.weiss@aisec.fraunhofer.de>
X-Mailer: git-send-email 2.47.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0188.DEUP281.PROD.OUTLOOK.COM
	(2603:10a6:d10:a4::20) To BE1P281MB2180.DEUP281.PROD.OUTLOOK.COM
	(2603:10a6:b10:3f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE1P281MB2180:EE_|BE1P281MB1827:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b21b3b0-268f-4403-2178-08de10a5c5e8
X-LD-Processed: f930300c-c97d-4019-be03-add650a171c4,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elRNdjNSRlRFOXZTelpPeXJqRlVURjVpYk1oSlJuQUhFWnA0SCtMd2k3UWtD?=
	=?utf-8?B?eUlxeFZHdDBYMU1SejFwaDBoNHdVU1g0UW83K2krNGdKdEZOQTIwcmROQ1pZ?=
	=?utf-8?B?NFJyakVsTlhuR1BscnE0VVoxL2xVY0N2bXlrLzN2WUMyb3hDUUNHNG4zemxp?=
	=?utf-8?B?SUM1dExTWGQydkdidjFmZnUyaVBnNFNkRlo2OSsvVTJxSGxlYnkxbVRzUDlk?=
	=?utf-8?B?WGw1ZDRkVlFpTlV3R05WRm9NcENNbXNUVU9VbTZnUzQ2UW1uZ05Gd2hBT3Nh?=
	=?utf-8?B?WHZadGRtaXVDQ2hTcHkrcGRuSVUyNjF4TWNlUS8zSTlrKytaMFdHaloxT0Nx?=
	=?utf-8?B?SWxLWndGYWxLa2thRzZveEtSNDlGVk9sODUvZ3VWWGZQK1Y5Vmxmb3hzMU9p?=
	=?utf-8?B?eHY2dENocWZIMGVxQnZSY1FtaEVOcElsSWRzTUlnN3FmYTVZZHJaY2VHOGpN?=
	=?utf-8?B?alFUTitPbnNPTGpIQ0R1R096cnhSZzBUSCszNy9hTThtZGpuOEdscERZRG9u?=
	=?utf-8?B?ekVoakxYMThsYmNZb083ejI4RDJvRGxwYklHSko4SjdpbXBCNDhLWUg5TXho?=
	=?utf-8?B?dmVpNk9PcS8xLzdRcC91YWx3TUVYYTBrTnR6THI1RGh3VkZRMllLYjdhUm1J?=
	=?utf-8?B?VHZXZEZGSVlVNmR2QW9mVzhwckZIcmtkdDladkowWHlMMmNsREZXVEh0STd3?=
	=?utf-8?B?YjQvSEJwc1kycDlGZnJZc1NES21tTitDbGp4eDMzSHR3L3doQmJsZU8wY0Yy?=
	=?utf-8?B?R1hKSkJZakN1NnV2L01UWlpkQmlkN0NiNS9abzN3OGM5WUhIN3BiZUFnSFdr?=
	=?utf-8?B?TEZVNUxWSkJuSVJlVzhpems1eFFINk5qWnM5M0VLSjBqN3FqVUlQTnI2RkZH?=
	=?utf-8?B?RkloeTI1M1hTclc4Y2VsNEZBM2R3azNzMmpTaVpIbUtDcEI4dmxVM1ZoU1Vw?=
	=?utf-8?B?cko1YUNlYkkyYjJvcEFrR0h1RDdEVm5KS0RsNndhdkdWalpLQ3QxSm5OcVJi?=
	=?utf-8?B?QjRoM0tWcG1sajBPQnp1RVkvU1NxT2dNSXROQldwdzFnOHdYR1hBa2ZNUzdP?=
	=?utf-8?B?aDhnd2VZR01BTnM4d0FtMCtyT0xEN2hhcld4RzhrOXM3NjdIVElJY0w3QjNR?=
	=?utf-8?B?eUQzdVd6bHp4SnQ5ejhDV3l6WXJCdXY1cXpFRGNjand6a0F2M0ZxT2FJWlE3?=
	=?utf-8?B?MkFEOUlkaHJ4aFVYWmE5Mm03a1puSTJnYnNSRGNEdHh4RmxYck5tYlZwbzRx?=
	=?utf-8?B?Z3hoYjgzb05kVDhjWUppQ1lVNnFPR1puYW5KM1psT0djcVBKTjdhVnFON1RF?=
	=?utf-8?B?VGk5emMxbFlDOG9xVmpCSm9BQlFaOVkzbGZMWmw3TFJ6d3F3OFZGMEdUUnBz?=
	=?utf-8?B?blFGQUsrN3ovOHpSb2FlQVJaSlgrenJIN2drR21wTG5CUmN2OXVyQUtkbmRM?=
	=?utf-8?B?cXFoNU1RWm02Qml5ZzNrVXZvRFVaQ0VKWFVYYjFyYldDVFFCK0tXNmU3ZzZU?=
	=?utf-8?B?K0N3cDhjNEhSaDdCWEFCWjZOQnI5cmFXeW56dHFXbFgyQTAvOEg3SGtQdVl1?=
	=?utf-8?B?dHVCMFQ3bzRhaks1WkNzeVh0TlBMTGo2aHhNZGpzSHRlVjBDbkpZbXhvM0s5?=
	=?utf-8?B?a2dOblI4aVd3cXg0QURIdk54NzNsQThjWDBTK2JMUEQ0WHpiQ2hscXlldWl3?=
	=?utf-8?B?d1ZZblZ0clBlaFZ6WmFGcXF4dlpOTVh3dlZMNW5QbFM2SkpIVXhGRDN6L0lO?=
	=?utf-8?B?MTh2RFhQeG1QbmQwcytzcFYzSjFJK2I4cm0xWklVRS8rMEUzaXBtNjJuUkFV?=
	=?utf-8?B?anpSa0Q3QytzRTMrTUFTaGNrMXdsUm9qWllJSi9JbEE2TnJMWWNhcjY1T2hK?=
	=?utf-8?B?R01FNEhhL2VzdlBJcWhXN2VLbC9LbHZaWXdEU2FuY2ZONWJBT21iditkRTRM?=
	=?utf-8?Q?1DwWNEar5ihCqUXNsMbWzEQ1YLAVDbhA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BE1P281MB2180.DEUP281.PROD.OUTLOOK.COM;
	PTR:; CAT:NONE;
	SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT;
	SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1pOSkR1aHNDQUVMdEpiWXoyQVdEOU5YckU0Z3hJN0dqV0pUS3Z0Qkp4WmJY?=
	=?utf-8?B?RlpnMDN3N3UzaFJ3ZVp1MFprTlV1eXBiMHZxY2xUTkxocEhRN3NDb0h0SmN3?=
	=?utf-8?B?S29teW9DSjF0K3VhTG13SGIrRk05MktaRHA1dmtGWUlNTWNOWFhVWVNrSkhO?=
	=?utf-8?B?cHFPUVRJUU93aldzSFplRytIUUJVUldQeVdvUG4yRGY1VllldTlacGJuOHR4?=
	=?utf-8?B?VW01ZVE4WTZ3RlhvaUtrTEtyeklQZ0tvYmpYREFFM05wbXVPVUd0K0FUZFBY?=
	=?utf-8?B?bzJvSlRmWjRRVmcwbzl0Ym1BRmhwQ1FZQUVwRlU1R3dySzE1UnRzcitYK3hu?=
	=?utf-8?B?MGhiNUpORkZGdmJzenorVS9EWlhxTTZqWHdQTzR4bDAxZDlVb1gzQkFiQ1M3?=
	=?utf-8?B?c3RIVFA1RC9VVXZjRWcrRFRTZWlrdjBwb2gvRUQ4eGhwemNOQ1M3Sy9GTGF4?=
	=?utf-8?B?TU1PdnFnS04xR1hEOVJ1UU5aRHh5L2ZrMzZLdWZiN1UzbWcyMVlYN2Zndy9k?=
	=?utf-8?B?dXBsZmEvQkNJM2RRNVBxTkhNYXZ0SHZsRTQyYTludFZMWS9TRzN5RjNYSWEy?=
	=?utf-8?B?UFBlV28xemNFRU5HZzEzVHZocWdOMGxWemlHTldTZTdwb3VqTUUxUkM2eFJu?=
	=?utf-8?B?WUlJcDFWeFRSUjJ4Qjk2aXhCZGR0MU9SM1AyWVNLWHUyUEdaVDRDNUZjNGhE?=
	=?utf-8?B?eEtsejE0Z3RCV0IzNyttK2pmK1dEWHJ0Y2Z3bFJxUU5zUFluZE1GY1JpRHFo?=
	=?utf-8?B?djVxdFpZaElFR3F4a1NoYnNYQnI3Z1psb3VkZVUvTnltc0JLMkNncXpqOWdD?=
	=?utf-8?B?QmVLMFMxWTF1bUxvQldINWc1eUhOdHVlN0JDTEdmOEhsWEkxbVVtZUVFWWNU?=
	=?utf-8?B?d0VMTXV6WHZ5SHBpNFozWGsvNG1DZjNrdkRZa3IwVTNFcWhFTFZqcE5vVk1m?=
	=?utf-8?B?MjZSaTNYK29sWHhOcEk2dkRJY2p1T1N4dWFycGxNbVU1M0p6QzJKZWpvbEpl?=
	=?utf-8?B?b0QxUnp4b3U1ZUd1NjkzTWgxeEt6ME9rNGpVSDc3QzNHTWRPVDFQRVBJdmMy?=
	=?utf-8?B?SEtEKzQ3d1dKa013UjVQUnVZVDJGMVNPRy9qU0NVd29pRW51anJsL08vLzBV?=
	=?utf-8?B?eWZ6TzI2NFBtclcrbUNxdEhwR09sYnlIT3pJYTlwVGQvWDhCQXE2c3QxYXM1?=
	=?utf-8?B?eWEwbStBMGFFMjNsR0wyK25iS3h4WnVEWlZod0FNQTVic21iU2doYU1RWFds?=
	=?utf-8?B?K1J5VmtZME1BMWUyWjdick1vbTRMdEVlOHpmaTVuTzlKSlRhZUlNNmJ5ZWNU?=
	=?utf-8?B?alNndEZab3RSSVFCdFI4Smx2cjVBQkFDME1jdms4YTFGTmhob1hxaFNHejFu?=
	=?utf-8?B?amhDWWx0TlBUOEcxQVdDOWo2a0pZZ2RIb2V0aEkxWVI5REc2RDVFSVhmTVlK?=
	=?utf-8?B?YWVubTBwQytoZzNaT2l6QXZTZnM3eHpqbzFMTU0yZFhKRTVIMUg4QjBuNWho?=
	=?utf-8?B?VUJocFJrNFVBWEFIRG16OXNacWMrV1ZHSSt6dXRHWk1Ra3R2WWY1NGRJa1VF?=
	=?utf-8?B?QTNqWE8wc0pYZWg4MThXVXJYS1N4SmVOY2VxelF2OGJadDBZdVBXbWFOU2pU?=
	=?utf-8?B?NHJCWTdlUnMrZkZXdU5SL0VOSmM4dlFLamplQ3hMVzZickw5TkZ6Wm1qbDRu?=
	=?utf-8?B?Mzh5ZXlSZ1podElIM2xZOWh0a3VCTEFoTHdQak13bnZ2KzFVNi9nRVpXVnpJ?=
	=?utf-8?B?N0VGaDJtTy9WUTlCeXFqcFd2dm53am5NMkExaXc2dVZyZm9FUi94bGxVZmF0?=
	=?utf-8?B?dEU1YVpNWkVBcEh0SFBrWTZUNTBkNmM4ZVNZekxSczBoU3lMaWdJcUVmbWdj?=
	=?utf-8?B?bDZqMmZUaHJ0RmFoeDN0elZWcnJES0N1RVJaZVhjTFdtL0VHUWNDdUZ6dUk0?=
	=?utf-8?B?QUlVL01iU3BYMUlOak5EZ3prWUw3YU9ZdDRlRHpEa0srNktKZEVoUG1hNTli?=
	=?utf-8?B?ODVmNERTQTU4Z0UyTGI1QjA4VVozNk52b1RUeTBuUFpIV2gyZFhvbitiT0tj?=
	=?utf-8?B?WmN0WkFwTjhtTEEzRWJWaHhyUmEzQ3RDd3FrNnhEWS9pYmVEeFpRaXltUXdu?=
	=?utf-8?B?OGZTck1hWSt3TkVnZkQxb1VaOU1VV0FBcHg0VTNaY3NrLzdHeXI0NGZ6ZW1F?=
	=?utf-8?Q?vWxnOVULDLOSgCvbPUaXOSg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b21b3b0-268f-4403-2178-08de10a5c5e8
X-MS-Exchange-CrossTenant-AuthSource: BE1P281MB2180.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 13:28:51.1128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f930300c-c97d-4019-be03-add650a171c4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y6ehPz8jZpyBplhfXJpausqP3KLUUKpVoBNrYoDqIeFhcF7dVj1qKkiKgF2vZDGW5tTYoX8fjQ8ewZQqCCG9gyXy2/Wk+u+iqUMyGqP4eErvq+5xWoQHLECLSPfsefHc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB1827
X-OriginatorOrg: aisec.fraunhofer.de
X-Mailman-Approved-At: Fri, 31 Oct 2025 10:20:24 +0100
Cc: gyroidos@aisec.fraunhofer.de, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, nbd@other.debian.org,
	drbd-dev@lists.linbit.com
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Syncronize the documentation with actual code state of the default
value for nbd max_part.

Commit 7a8362a0b5919 ("nbd: change the default nbd partitions")
changed the default value of max_part from '0' to '16'. The admin
guide still stated '0' until now.

Signed-off-by: Michael Weiß <michael.weiss@aisec.fraunhofer.de>
---
 Documentation/admin-guide/blockdev/nbd.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/blockdev/nbd.rst b/Documentation/admin-guide/blockdev/nbd.rst
index faf2ac4b15099..6d631ea53e8a2 100644
--- a/Documentation/admin-guide/blockdev/nbd.rst
+++ b/Documentation/admin-guide/blockdev/nbd.rst
@@ -25,7 +25,7 @@ A) NBD parameters
 -----------------
 
 max_part
-	Number of partitions per device (default: 0).
+	Number of partitions per device (default: 16).
 
 nbds_max
 	Number of block devices that should be initialized (default: 16).
-- 
2.47.3

