Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31242869
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 16:09:07 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 6ECBE1028A78;
	Wed, 12 Jun 2019 16:09:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id BCF2F1028A6C
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2019 16:09:02 +0200 (CEST)
Received: by mail-wr1-f42.google.com with SMTP id p13so6979857wru.10
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2019 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=moj07ejf9nJul7nRLaoBa7K5Cnh9GNsnPnfSrqO35ao=;
	b=kR4n7YH5gLc9/k5PWUHDC9gE/itsg5uPv/U1LpiPOkjcKgUq45WxgOlzn5zyrur881
	avaF46+cTZtCP1v/H5gutho2bHZw0noKnuOgVVOem4OfjpEAPASWG1MsEk40eNMCdtRN
	V36gH6fPABSg9vGutGxllQhxLbRjydSxIl6aL+VIoyt+YGyysII61dX3358TcH5eRCUo
	QjaerTl+pjDufRoM/VP37PDKeNRp0yt58BfrUy+hheRNDzK3Mg6DIc02QDgoh3GZz7qC
	LMhC8vDxNvHdFS7JyzNnzDrgDfQTwY055NE2GJBXuHdIX9V0WYBzLWWjm5Iq98SGCP3U
	bqFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=moj07ejf9nJul7nRLaoBa7K5Cnh9GNsnPnfSrqO35ao=;
	b=DeS/fb28EGCCLlwa+bjIDHDHwyK0tDAi4nADV+Nr4Ax3oyaS5GsX/vlRaoq9m0n2Wf
	SZVQq24NIchrTrXzc8+htiY49uriD2S/zyriQZFcUJOK936s1NYpFea9g2d2bRRX1B/F
	w+zW3wmPAGdGA4q0PFsc67MtNPPR1vBTiXFMNycfoyQY873gQoOHYr7QXgEcV6WhcI1x
	5q+5K2GrzypuPucOAjOqTiF6a06deoqZ9sUzcazQoEsY52QwnoSCROuXldZC1BPXz7b2
	g88/IowQJwK44RqnDZhqjhkALVSDT8rokFSylK1FPldT3v7WHsiiD0qrVYOrgmlq3e1y
	Mf+A==
X-Gm-Message-State: APjAAAWZ0bfBgBYVxxfD/Ya6jJNqXHTMyE9qqEopR/1eFLuBI+0Rqt+o
	/ZNHbVUTZ7pTpXqqdjHcZOrAybzXaAg3Qw==
X-Google-Smtp-Source: APXvYqxyvAebCxfAwJXnjeqN1skfcigbnIsEVQYMV8Tn0C7a/1Yjm9ZJVFiQ+zYaCAwWTAPi3irEfg==
X-Received: by 2002:adf:e7c9:: with SMTP id e9mr40616109wrn.321.1560348542224; 
	Wed, 12 Jun 2019 07:09:02 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id d3sm9488733wrf.87.2019.06.12.07.09.01
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Jun 2019 07:09:01 -0700 (PDT)
Date: Wed, 12 Jun 2019 16:09:00 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190612140900.GY5803@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <9ddd5d91-affe-4a82-b563-45ea6082f5df@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ddd5d91-affe-4a82-b563-45ea6082f5df@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Drbd-dev] avoid compiler warning about redefined macro
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Wed, Jun 05, 2019 at 10:05:29AM -0600, David Butterfield wrote:
> In drbd_dax_pmem.h:35:
> -#define arch_wb_cache_pmem(A, L) do { } while (0)
> +#define arch_wb_cache_pmem(A, S) do { } while (0)
> 
> Avoid compiler warning by making the macro definition exactly match the one in
> linux/libnvdimm.h:
>     drbd_dax_pmem.h:35: warning: "arch_wb_cache_pmem" redefined

Well, it should not have to define the same macro,
so there is likely some compat ifdef missing (or just an ifndef)

also I'm pretty sure the original in our code was copy pasted from their code...

    Lars

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
