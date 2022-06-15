Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 193D454CEB5
	for <lists+drbd-dev@lfdr.de>; Wed, 15 Jun 2022 18:33:13 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B2343420F78;
	Wed, 15 Jun 2022 18:33:11 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
	[209.85.218.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9D746420632
	for <drbd-dev@lists.linbit.com>; Wed, 15 Jun 2022 18:32:59 +0200 (CEST)
Received: by mail-ej1-f43.google.com with SMTP id s12so24355334ejx.3
	for <drbd-dev@lists.linbit.com>; Wed, 15 Jun 2022 09:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ceb8E6/DSaYnRXVA+UXn75LFb9ReftlzFzi22w6y83s=;
	b=VQfgUpwtf4/a3iMr7fpp8DkC0F6oIgQ6WCQtZ1tvPiSWxqwEyIY38HKKlZJafys/+h
	hQ69JHuOxGoGKb1U9Vz75hk8CRdEz9nt0TBBwjSalK2IApGQo222AjejLeJL3NqzLF8Z
	Xr57szaRzApziCtafoN4JFRKeZ3+/vTVclGRj5HoOh2gVBr4BRdW6AIIpYLHmEnqM1hv
	eXN0f2PP3ImXnacMTL6y+1S1NQSZFXjmAPPpQsq/tR3plKtj9pt/S1uGGdKw5cqoV9zK
	qkmoMnHRmGH+yM/Qku9ZDu6VYasoIIUJBRJXRe/08gmGuTHeaouxlvKD5kt4irvNAFrO
	lxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ceb8E6/DSaYnRXVA+UXn75LFb9ReftlzFzi22w6y83s=;
	b=EYtwXPpIBVYL9jWR9SrtAzASGspqNQ+tl9zgQcUYFtGFvPqCerEtUmmMGNRKU4zztB
	zavlEe3rWnmKoSjCOujzjHAez0v+IRQ9IUkv0J6fmkHgM6ttylUlgsjqpKic3mNldm+z
	+9szCe3LmuriNixS6QB7QRVz6R19Go8aFynaJI+yczNb5VomI/naWivnZDvrQMNN6dgp
	KTUHu+PZhciqokDSaZOeHbA/ejtl+/RZbMpBUChY/JX3MurUGAMzYrjnnUubllivxv2+
	ua0mCxItjfCviJCd9x2lAuc33bRWoJC3PgzGGVhNb1XMq3hCEt5anKkcSU+/0+z6O8un
	gYdw==
X-Gm-Message-State: AJIora+niUrwwlSGVDeInh6xjRNOdayFxlHxL3AhkU5L9cLLDbecsgZO
	/GyoCEtifSFDmVsxDbtIPPZGTVDxkfOZ9U3on4aMvpeC
X-Google-Smtp-Source: AGRyM1txLZ8fVXZMTjyV7Ui9j0IIk/HBV15aotHPJfocwpc/Eu2eDiu1MzjScfz25jS6g/PtKB+3SEWGUiPDqTpnShM=
X-Received: by 2002:a17:907:8a1d:b0:711:d86e:cc5 with SMTP id
	sc29-20020a1709078a1d00b00711d86e0cc5mr597228ejc.237.1655310779124;
	Wed, 15 Jun 2022 09:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220615140620.31630-1-kvapss@gmail.com>
In-Reply-To: <20220615140620.31630-1-kvapss@gmail.com>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Wed, 15 Jun 2022 18:32:48 +0200
Message-ID: <CAGNP_+VHaMWzb-Z4ujuasuVDoLE459JAQ6q88JDLGeKJwKfmjw@mail.gmail.com>
To: Andrei Kvapil <kvapss@gmail.com>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] compat: make spaas url configurable
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

Thanks for the contribution. Seems like a reasonable idea to me.

> diff --git a/Makefile b/Makefile
> index 87c29518..37d7851d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -37,6 +37,7 @@ DOCKERIMAGESTARGETS = $(addprefix dockerimage.,$(DOCKERIMAGES))
>  # Use the SPAAS (spatch as a service) online service
>  # Have this as make variable for distributions.
>  SPAAS ?= true
> +SPAAS_URL ?= https://drbd.io:2020

What is the purpose of this definition in the top-level Makefile? As
far as I can see, it is only needed in the other one.

I guess it serves a documentation purpose, showing what command line
variables can be set. That is presumably the point of the SPAAS
variable in the top-level makefile. In that case, explicitly pass it
down like the SPAAS variable for consistency.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
