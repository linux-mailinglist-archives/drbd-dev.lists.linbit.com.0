Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6764377B2B3
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Aug 2023 09:40:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3CACC4252EC;
	Mon, 14 Aug 2023 09:40:39 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 83E7C420AFF
	for <drbd-dev@lists.linbit.com>; Thu, 10 Aug 2023 10:26:25 +0200 (CEST)
Received: by mail-wm1-f51.google.com with SMTP id
	5b1f17b1804b1-3fe12baec61so5173765e9.2
	for <drbd-dev@lists.linbit.com>; Thu, 10 Aug 2023 01:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1691655984;
	x=1692260784; 
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=5MR+5PFugPovCt/ZI4txJmfCVwmNkCdr2Q2Ayqtgi6o=;
	b=WdVTRiGcf7KWGdovrZhaYzLlwUVf9l8MODnlO7thvaEU+sC0Cza6ueuUU76mU8Yg74
	0Rfo3A/G1LS/Qpxbw/kebtdiDnffZ1PK1Mx5ni/vhp3Ox7JYgNyro81tJz49qyjI1pOK
	nXuUDwV0PAqZUQNv4nlVTSbu3x2EUPBXuiF4vH/71+DABd10ENZekJgw0hYnm8/PwMEF
	i5p1L6KLu2lJzaH3F6JrSSNIBk9oWL7DxAe5ybu6qlCzdOL0mloNb9GsVjRy3Bnos7vy
	72nD56tdS3xUOhovArpb5gjat/Vw/j1shREx+OLuLKoXGr320YfTYLqIq7zmUj50GZX1
	N8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1691655984; x=1692260784;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=5MR+5PFugPovCt/ZI4txJmfCVwmNkCdr2Q2Ayqtgi6o=;
	b=eaxI35esEvmOuC0DigtCOctv104uniUnqIDmQcySgi+EvQVWrJQ99Kdez8f6C/amzq
	y7wbA0BJl7gaWnysytAG/73csfdl/RDrC4T4mhNXPhwaDSIddRNvRi2Z0aPl4e10moVG
	z73n9huGf8aVZNlDBWJf3p4iPRG14DevWMJtzD6j3o/492gvga9XA97GdZnojXfobWYV
	zly8h44UzXRZ0vlItpsf7FbzXRf5u709PzH0JCypt6NiopMFVZ0Yfm+8OwJnFWYQHdg2
	ocZHHNrccjfvbXoWiAHgfdilz30SVo+hc5B/w/Q+M18Zm1DCoHVvYntPkEmcjpZmc9/3
	fjRg==
X-Gm-Message-State: AOJu0Yxn7mhmfmpJOUBxv6d/+pwl+xBWTuWQCoSZl9mIfJgpbxqZfPfm
	Jrgm8ZpOOmwIdAUFO3b41jdy1w==
X-Google-Smtp-Source: AGHT+IED5EvUAbIPy9tMLOguRqy1DoclqnEEVwX479WbGpTt1LpbY1tJy4NuoGcxJzNG8xckTlf9Gw==
X-Received: by 2002:a7b:cd0d:0:b0:3fa:98c3:7dbd with SMTP id
	f13-20020a7bcd0d000000b003fa98c37dbdmr1240929wmj.41.1691655984457;
	Thu, 10 Aug 2023 01:26:24 -0700 (PDT)
Received: from localhost ([212.23.236.67]) by smtp.gmail.com with ESMTPSA id
	o10-20020a1c750a000000b003fe2b6d64c8sm4321899wmc.21.2023.08.10.01.26.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Aug 2023 01:26:23 -0700 (PDT)
Date: Thu, 10 Aug 2023 10:26:22 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <ZNSfLomTSZy/4b8W@nanopsycho>
References: <20230809182648.1816537-1-kuba@kernel.org>
	<20230809182648.1816537-4-kuba@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230809182648.1816537-4-kuba@kernel.org>
X-Mailman-Approved-At: Mon, 14 Aug 2023 09:40:36 +0200
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, netdev@vger.kernel.org,
	philipp.reisner@linbit.com, pshelar@ovn.org, jmaloy@redhat.com,
	edumazet@google.com, tipc-discussion@lists.sourceforge.net,
	lars.ellenberg@linbit.com, ying.xue@windriver.com,
	dev@openvswitch.org, johannes@sipsolutions.net,
	pabeni@redhat.com, drbd-dev@lists.linbit.com,
	davem@davemloft.net, jacob.e.keller@intel.com
Subject: Re: [Drbd-dev] [PATCH net-next 03/10] genetlink: remove userhdr
 from struct genl_info
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

Wed, Aug 09, 2023 at 08:26:41PM CEST, kuba@kernel.org wrote:
>Only three families use info->userhdr and fixed headers
>are discouraged for new families. So remove the pointer
>from struct genl_info to save some space. Compute
>the header pointer at runtime. Saved space will be used
>for a family pointer in later patches.
>
>Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>

I'm fine with the existing message, but what Johannes suggests is also
ok.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
