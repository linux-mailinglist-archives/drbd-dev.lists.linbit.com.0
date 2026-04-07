Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF9dKFxq1GletwcAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 07 Apr 2026 04:22:20 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 486F13A8FAB
	for <lists+drbd-dev@lfdr.de>; Tue, 07 Apr 2026 04:22:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AB5F5163134;
	Tue,  7 Apr 2026 04:22:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
	[209.85.161.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 67AD5160645
	for <drbd-dev@lists.linbit.com>; Tue,  7 Apr 2026 04:22:16 +0200 (CEST)
Received: by mail-oo1-f46.google.com with SMTP id
	006d021491bc7-682fce74c06so2701387eaf.3
	for <drbd-dev@lists.linbit.com>; Mon, 06 Apr 2026 19:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1775528535;
	x=1776133335; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Wn8H+bhResNP32UDPeiU+nqzTT722Ns+CY4osAuhaqA=;
	b=iOsNjnosOrDyJrmcApJafIMUGR+r8GjmBJKwBDiJHro1yN7FwZsg/QXWlrFHbF+Ruf
	eu7ky+d/q3ktKm28Iedu7ZNnu2D4bgoPjx5rZpnT1IiXqWutoUOn3ziYMF8n7USsk8nT
	J2RaDYbw/jay+NIrJqoYjeIJnJBwt36WLSdTm5Gk2Vz2PxN0EyJeyLGCRvDY/ck7+1nG
	wuCbdQZtlb3otFF6rqFHICXa2z8VsYsZjUIpX9c9IrPaOb6tau7s0x1e0qegJKY4ZqhO
	HYf+r9IjxKj4xB5UOkwE7DXLp9iYSEmypbF/HrO6O6mT88L9KKmWj68Ml1YN/Bq/7r4m
	S7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1775528535; x=1776133335;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=Wn8H+bhResNP32UDPeiU+nqzTT722Ns+CY4osAuhaqA=;
	b=ao3JiwkGCtBIOEIcOc/9Nd6zluzbE7VODr78fY7Omr0c0wsdCBeRMRoxhf0X5F0YrY
	Lvpa6iWV8qya6Z6sB87A8ySOCS7ljcc5EDYRF4GXjJfHIB7x4jDOY1e/niTsLiBxEAMD
	X7eWP/PhsCUPdWfh8odVTIwYQ59WMMVwPO4cujeukFfgzs/f4Scy9V/RKhx/oaWaJLE0
	u7zo3D2naPrTtAbDxUu8HmMggueG3pPrI9ponoQl/7OwqSxDgtnBkESE8yH+gsfkjbI6
	zfNJXVLA7UAyhfvzj3Wv5t3ToXUPIzVvycDne9ezO/8HKuxPUaoBJBKXK9O453L+lQ/S
	U12Q==
X-Gm-Message-State: AOJu0YwYjh/dCCg/+JxHzdHmf0OpoB1x65CkkCGaDhwk1NN32/pDTjjh
	PqDDD0+qvFv1bkq7hHlBbGs8Ow/dcqoEWA/BaGdp/vJ7GCavkz6h7szrp+u6jdH4sSg=
X-Gm-Gg: AeBDiet3xyTjoDmhrkxP38satF5rvp/FuvnBIROvcqOz1ceL3fWGuAeXeMqZZTigQgF
	uABIqPQP+8DY8GHZEcLGW/tmSygFqTZSSCikuuTzKRoFay79XeFV9eLavkVDbouamxhdsapK606
	aLZDMQ8UrwpljAQwrUD2oReo8+o7gx6Lb89dwtvw2kBR01vztapgr0Jyf+xAk/ltUf2S6xJ76tJ
	/9eJ3WDeANKaFbRJAItyjfvxdMgXiJAV3RnFQ5Qd5uyQm994/Zu8XiS8Zxb/rQFADyEcaqdrP18
	xXGoIxvjMI+gLFNi102FvRe9vlGrwLKPlSEaUR08WLOMi8frrkTskYl4EV9yp8hUNNMoC1v3hzd
	DD1LjuuUFLtYzlJb84OSfw9y0VF19DN+nrbuQSiTxU2rZMqaSHwiXheoQlx/I3/Pj+X3S/qHAL4
	aYipdl/BrVKKYzuH0lTaYAs29iChS4221iTwN3UaEaDLWaGwG+bttKUOO6rMX7X0uxreZHbOpKY
	6ML
X-Received: by 2002:a05:6820:c90:b0:67b:baae:3339 with SMTP id
	006d021491bc7-6821fc65f48mr8544987eaf.45.1775528535114; 
	Mon, 06 Apr 2026 19:22:15 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	006d021491bc7-682b375bc28sm6696829eaf.9.2026.04.06.19.22.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Apr 2026 19:22:14 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260403132953.2248751-1-christoph.boehmwalder@linbit.com>
References: <20260403132953.2248751-1-christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH] drbd: remove DRBD_GENLA_F_MANDATORY flag handling
Message-Id: <177552853342.149947.7297762019080456826.b4-ty@b4>
Date: Mon, 06 Apr 2026 20:22:13 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.1
Cc: Johannes Berg <johannes.berg@intel.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[kernel.dk];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:johannes.berg@intel.com,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:kuba@kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[kernel-dk.20251104.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.825];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 486F13A8FAB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 03 Apr 2026 15:29:53 +0200, Christoph Böhmwalder wrote:
> DRBD used a custom mechanism to mark netlink attributes as "mandatory":
> bit 14 of nla_type was repurposed as DRBD_GENLA_F_MANDATORY. Attributes
> sent from userspace that had this bit present and that were unknown
> to the kernel would lead to an error.
> 
> Since commit ef6243acb478 ("genetlink: optionally validate strictly/dumps"),
> the generic netlink layer rejects unknown top-level attributes when
> strict validation is enabled. DRBD never opted out of strict
> validation, so unknown top-level attributes are already rejected by
> the netlink core.
> 
> [...]

Applied, thanks!

[1/1] drbd: remove DRBD_GENLA_F_MANDATORY flag handling
      commit: a9c4b1d37622ed01b75f94a4f68cf55f33153a31

Best regards,
-- 
Jens Axboe



