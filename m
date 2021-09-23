Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3E0415CAF
	for <lists+drbd-dev@lfdr.de>; Thu, 23 Sep 2021 13:18:41 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 454764207DD;
	Thu, 23 Sep 2021 13:18:40 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D6F88420629
	for <drbd-dev@lists.linbit.com>; Thu, 23 Sep 2021 13:18:37 +0200 (CEST)
Received: by mail-ed1-f50.google.com with SMTP id c21so21985693edj.0
	for <drbd-dev@lists.linbit.com>; Thu, 23 Sep 2021 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e2wzaUTlLdbKBw2Vc1qx5Y4zBkEg4sDivTkNDucis0U=;
	b=QlJmvGcMGT5YLxdI2oGB6HnfA0hLw8Fql56Tx2Jr+TADkVnigz//RzFj2k9Z5Dz0jg
	rIMuzn8fcFWNF4jLkRWm551n2Af1fqMdov6+hl4M2RgzU9OERn1S7KOx00lFcfK88LEF
	xU9Ta81qHcR14KjT3N0cY1etP8YFxIUHN4t0xtSeqNbDtnN1ShwOZhMIyeevuhz2bWzy
	4eisUvpi4AXxxaqB6b/kxDkYRNuoIO841sBYl8jcU7GPF8mvk/X7UYhUJdgae5PW8K85
	3aoNx4OAgYcdojtKuFNXpsdKkQz8EEHPvsEWxCT+B0l/GVLlq5HuYEV7Xu5igDgpRXV6
	9F5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e2wzaUTlLdbKBw2Vc1qx5Y4zBkEg4sDivTkNDucis0U=;
	b=WIplHfd5JB/a45WYRKSk9vwrEnmhkOB32jO030vQVrTraiyMi5fY6hCy4+MmO5wiNN
	1o6/ZUtuScNm4YJajOFVaC/kgVfkW9kctoFiBRpsosbAfxgvoAfmF/srhMmf8qY/o3tj
	X4jgLR5TZ4GGcsarJjOLxQhy9lQ0uf1LMjQIR1ellX6RNyESWVi1hPj/nzmxoVwILV5k
	midTpeOBsGxq8yZQyMo6azDd4IxtNysrJZv/vV4teh4FOFMFD52KcJ0MOMD20hrIWHxq
	b653KsBMcxOa2RF3HR679jx27csFzy54Iz4sxcZCozq4xYuZa4FhT5UC3P6E/Ipnv4E/
	Kmww==
X-Gm-Message-State: AOAM5308t2ee+K/3BpG+leQObeyoaOxaSiQZhAbMN/HfI6yXdNxonQcX
	HWUTW2wYuKi/tCPGctWHpOU+pFPP94rtJu7GxPgDeb7Li/76vWFD
X-Google-Smtp-Source: ABdhPJwGlR3JYpWvXt8fhCdahlIbOjEMI0fedr39Psp3aXHYCgXOFDntx4KHfFe6w8/XKQJ4PXO/udss3ogEW8pNDro=
X-Received: by 2002:a05:6402:42d5:: with SMTP id
	i21mr4774015edc.14.1632395917176; 
	Thu, 23 Sep 2021 04:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAGNP_+VFUJfijkem8TWr1ptkJXbdZryuvbnpLY1GCBgPvKzdzw@mail.gmail.com>
	<20210915110743.1271706-1-rui.xu@easystack.cn>
	<CAGNP_+XVmkZ5jAuh_jpDkdddzNfDNW00cTiUDRgGh9R=7Bv7ng@mail.gmail.com>
In-Reply-To: <CAGNP_+XVmkZ5jAuh_jpDkdddzNfDNW00cTiUDRgGh9R=7Bv7ng@mail.gmail.com>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Thu, 23 Sep 2021 13:18:26 +0200
Message-ID: <CAGNP_+V_6m5b=FHDnUEw6RHdKuC8Gu_WzcvpEsZv=ESHLXFv_g@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v3] drbd: fix a race condition in
	update_sync_bits() and receive_bitmap()
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

This was included in drbd-9.0 with:
https://github.com/LINBIT/drbd/commit/a9a54e48f5d6eb0b06d5832246ff7da2305fe5e1

And merged forward into master with:
https://github.com/LINBIT/drbd/commit/6cb88bf2af4a5628d09276e92f905405d01e0270
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
