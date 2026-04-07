Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKSNJ1341GlszQcAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 07 Apr 2026 14:28:13 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 40BA13AE5ED
	for <lists+drbd-dev@lfdr.de>; Tue, 07 Apr 2026 14:28:13 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AA3C2163139;
	Tue,  7 Apr 2026 14:28:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
	[209.85.160.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BC321627C2
	for <drbd-dev@lists.linbit.com>; Tue,  7 Apr 2026 14:27:56 +0200 (CEST)
Received: by mail-oa1-f53.google.com with SMTP id
	586e51a60fabf-40ee9b945d5so4042983fac.0
	for <drbd-dev@lists.linbit.com>; Tue, 07 Apr 2026 05:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1775564876;
	x=1776169676; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=JTvEm0HNl3SdADY92hVTiu3yjS8irZ3O+yzPGT/Hy10=;
	b=pMIg4QgYZhNIpYgDPIscnX4t/kcQRgHTvlNeeCgWSzi9iQIh6b+Y0Lk9IqA5AkQ0LG
	J63DEsPS9bgCRgCcD8SiSe0+wIc7jCQPv0lxfqWLK4eEi1fK5T+9dfG5yIdPz5SwqRL2
	u8uBjam4KnnUMrC2HD5Wk26CkSuYKrxPhZl04y9R9fCctOx18bSszAY0rCetS4t3LrDV
	oj1JWBuSEhQH+5Ky9+HqN7SDfOMH5fajLbTAus463KFKExChIEVoc1tCSNFcNxkIT5BW
	KuLfmTgJCJGF4UAbQMMTMbT5AzUyxq7k71DD79Oy6zaaF+QXd4xbhpTTrWP8kIBOMvxR
	xwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1775564876; x=1776169676;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=JTvEm0HNl3SdADY92hVTiu3yjS8irZ3O+yzPGT/Hy10=;
	b=N6jZ896y4Jt6jnoGxJ5LfFKRUvXDD5ACMhj8iAReIHMpX940EgevaRyJJyUVrdg5P1
	u/vqaMbBXA/MlqiStf9lFy76wzeqsFXCZkiPHVIqCGnzI8xGaS4FdzQbGO79oN2DcjxY
	Z4Jwg5p/gGL1bnh9SvFGWBvOxD6KFPlX/GAB/PfF0bG5Y5UZv7gwD40ms5blczRMmPaQ
	uasn5E6SEmS5EeRzbEXhDinUK5lOg62Pworvw2wHL2pdKPpxwgzK3xkdRVdrFPCyLTXh
	fmMjDMedCh3Cy/MnYqQRYEA2RvTq2OTQkOLLSofy+bFmUC7972lSjXK7sJdwakgeeCbk
	QjgA==
X-Gm-Message-State: AOJu0Ywfgd6Fsd/4usZrX6y/ARbuy6vHY3WMOyQZkCASoq03BN46d301
	czYr0DHaMPs7iIRQodd75zEOInwq/M+gR8DYhz73H9nj9KhZilflXHL1YKa+hRTtHEY=
X-Gm-Gg: AeBDieuMt4r3sm0fh/1dD0K1ljhtLrV0InSmYSGkJjsS+0lwx4j/4cGzI0kDsNabzBg
	PIEg/nBMyeqTbHHum4KWGbP/fEVEqPAfV0v7MO2n3PdXDMyy4XDrkg2zKoDs6pdrv+2lUK0+fba
	6KaW9dQty2ZQQt1Hxa4nBH7GsyrlnNkEdsamqMBENg1IJ8i7JR/qyLYezyQWcni2/aCTQQJENuc
	Phnltmh63TapJezmoMC0Wf7JZtWYDP3YsD849k1kkAkQxEPOmaCphIzF0BwCHSN6DYSnEPx/BeL
	HL1eib6TCp7JdfPFrqmUfp95ibBrxCfOMbEjbCLvwGD+lmWH0Rws1cqrbbysTWuUHxiCwMXzUrv
	LwRRjyvsqqPDG027nMVD7+OnklSKz8DEiygg2RNZk2/GxGMGbpHYR5QStw5gZcD6wt6n9j0UnaY
	VE1j+5AB8PWsCDYHu2kdh7coqJrXaOSszWltSfXxMCA0jVLHxeUppEeMNJ5klxsnnjKgPBl8sDa
	6fl
X-Received: by 2002:a05:6820:2d08:b0:67e:3e13:3301 with SMTP id
	006d021491bc7-6822094b477mr8731867eaf.47.1775564875792; 
	Tue, 07 Apr 2026 05:27:55 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	006d021491bc7-6874bdf0f3esm1710157eaf.4.2026.04.07.05.27.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Apr 2026 05:27:54 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>, 
	=?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	David Carlier <devnexen@gmail.com>
In-Reply-To: <20260405154704.4610-1-devnexen@gmail.com>
References: <20260405154704.4610-1-devnexen@gmail.com>
Subject: Re: [PATCH v3] drbd: use get_random_u64() where appropriate
Message-Id: <177556487454.160102.7876439561425068141.b4-ty@b4>
Date: Tue, 07 Apr 2026 06:27:54 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
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
X-Spamd-Result: default: False [1.09 / 15.00];
	R_DKIM_REJECT(1.00)[kernel-dk.20251104.gappssmtp.com:s=20251104];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[kernel.dk];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linbit.com,gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:devnexen@gmail.com,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[kernel-dk.20251104.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.953];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 40BA13AE5ED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 05 Apr 2026 16:47:04 +0100, David Carlier wrote:
> Use the typed random integer helpers instead of
> get_random_bytes() when filling a single integer variable.
> The helpers return the value directly, require no pointer
> or size argument, and better express intent.

Applied, thanks!

[1/1] drbd: use get_random_u64() where appropriate
      commit: fa0cac9a515877fad856c860ad51107b86ed6c4f

Best regards,
-- 
Jens Axboe



