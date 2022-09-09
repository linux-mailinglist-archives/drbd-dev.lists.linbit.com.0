Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCDA5B3188
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Sep 2022 10:19:12 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BB84421748;
	Fri,  9 Sep 2022 10:19:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
	[209.85.218.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ED5C24210D4
	for <drbd-dev@lists.linbit.com>; Fri,  9 Sep 2022 10:19:03 +0200 (CEST)
Received: by mail-ej1-f42.google.com with SMTP id go34so2283614ejc.2
	for <drbd-dev@lists.linbit.com>; Fri, 09 Sep 2022 01:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date;
	bh=8sr9DhE1W5PS9ZmyrBX+DJeInr0Ry1wNsCpzQ1AUEoE=;
	b=a+2aNslyBiGvJQUfW+Km9YNvcUXVGvMSliw79gx5BaRyfSNVNEZ4ufnUZzOTJX6GZz
	mRFq4BsKqWeJyjUitXJTNJO9inrC3sq9hrz5J+QswMF8nclet3Cp0yVOcb/r6qiABq+1
	7/FH7R5/zLO9SgImIbhODcuqiHv4et3/oeI9gzi8hz6CZxAYxsoL4Kfvarwmad9kcIId
	Bgc7IZiUpmS711uWeW0JF8EPUhFf4YLZWwVAiSiTiHXVEybI8Nr6bgWm/FkCmA/P0f3I
	RQuvCANfgUJDKw/uTUcyf5f89L8+2xqV2RD4e9ShCmLAWoq4cWvepycVhEtEyFL55Dm+
	kqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date;
	bh=8sr9DhE1W5PS9ZmyrBX+DJeInr0Ry1wNsCpzQ1AUEoE=;
	b=DzpL1qqs9+Qx7O8U7J0yzCly4fH4f84QQRUDQ5N7zTQLrMu0iGebZfmrNAE6U7praX
	+zFvvPIGNUPuHhaCGtskJnZreDCuo/ZMntu20b7NDXW+h4Pkfy1eh+dFBI1MwCLu7xzI
	aP0Kq+pO14ZWeUViDMvCRpqtQUsXhlmxjsSEavydcucUe4S+Y0iJtTpO8++tma68alT+
	MWO2dsdUgMaM1IUtF4Tv8qZzuo1lJTtNdu7pzC6H3EfrlJh9RQYgas9oAMPSVQJVOP4w
	ILXiFfdnX96XVqLvRXeVlM/F0HkDGwa3QVj6vbQ+9iL4aXir3VoESPLKzk1v3Y/+kJS6
	Y9vQ==
X-Gm-Message-State: ACgBeo1EvrU1B1LeMmqQMODuuO/5THFXxYMrtmz6t0hJCxA71GPC4rz+
	hJJ5T+GfrwtNGM6qB8apxhuOHpmYjZHoxmNMXDnNrGXy
X-Google-Smtp-Source: AA6agR7TpCe2AnkaPZGc60S1yo7wtZbr/szNplIcmbim9r4fZPrr7ZsXoBe+mfztHE1he2ISs8M1CCe2ZZHqFOTAsfU=
X-Received: by 2002:a17:907:7612:b0:771:db66:7b77 with SMTP id
	jx18-20020a170907761200b00771db667b77mr6715643ejc.228.1662711543055;
	Fri, 09 Sep 2022 01:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220908211337.17090-1-veggiemike@sourceruckus.org>
	<20220908211337.17090-3-veggiemike@sourceruckus.org>
In-Reply-To: <20220908211337.17090-3-veggiemike@sourceruckus.org>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Fri, 9 Sep 2022 10:18:52 +0200
Message-ID: <CAGNP_+UVojhL-zpJY_atDE=3v3pd=j-SsKVCR-xXFW9geAEKkg@mail.gmail.com>
To: Michael D Labriola <veggiemike@sourceruckus.org>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 2/3] drbd: remove reliance on bdi congestion
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi Michael,

> A serries of commits between 5.17 and 5.18 removed inode_congested()
> and all it's related functions because "No bdi reports congestion any
> more, so this always returns 'false'".
>
> This commit just returns false in both places bdi_congested() was
> called... which probably isn't the best long-term fix.

I suspect this is the best we can do in both cases. Perhaps with a
comment explaining why we just return false. The alternative would be
to invent some kind of heuristic to guess whether the backing device
is congested. That sounds like an intractable problem.

It would be interesting to know since when "No bdi reports congestion
any more". That would tell us how long we need to keep the compat
code.

It would also be interesting to know whether any real user depends on
this at all, but we'll never know that.

Please go ahead and add the compat code.

Thanks,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
