Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id BA00642861
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 16:06:24 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 0ED281028A78;
	Wed, 12 Jun 2019 16:06:23 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id C469A1028A6C
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2019 16:06:19 +0200 (CEST)
Received: by mail-wm1-f46.google.com with SMTP id v19so6681546wmj.5
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2019 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iK072x8zHIY9v3ZuBoNyBnayHdTdS3ZYFxzX5cHZJN8=;
	b=2JiwIVMViAoDq6q6ZBTmpOA7lrebronWqVh5CXogW2fTXSCD+y3sSqvryqR+dtrktl
	sr4dJjnseCKKu3CvJRc3v2lynwV4ImaiD7xjky5Vg/aoT5PAG5X8iV8D98qAOpACpLQG
	dhK69Bk4cDcImkSsU8yFOQozL7jmQoaSALNpq7zW8DPc8C6UbNjuYyC4cZEZQoMQ/56N
	3IcBUMUEkU7h7PLFvfVWWTc4OnF4zxxJjklegWgG2s5kv6NDnyXxhwwZmB2xvnmTyvef
	cps90Ko7JkCdmFMDT2DAhkh1ZPabv48fL81X/iG4OvfCawXKwNNakQszOGf25ySXtals
	+GrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iK072x8zHIY9v3ZuBoNyBnayHdTdS3ZYFxzX5cHZJN8=;
	b=tbu/Cqpq2dxQ2nInRGWKW+QttBZyrtRbENED07dSo2Xn00eoc84N2CdYEqI/vDKTXK
	Cbx2cGL4F7ZC1ZOdIWoWM/UUhIBdH6DiOLQfuyseMhl7xOuev8E2d+gudQKQc9YiCnqh
	orVxAVuyQEgNWjFPJ8igvmYzMf1Vk0I3HLT+MkIGFTeoyBnOi411NOjB2kIJEgsrk5kC
	uJ53vlofd5DKxJOgIvbUA8ckPHbRSc+JWvGl/63J6SR+jNJ1+35q0mC1RffWvVYJakJ5
	SNVagLl+DFWng8lvORYBs17qtWZWeH+4LxcxLGuPoU60n2tD+Re5i6280VbFpmYqfeAW
	EBzA==
X-Gm-Message-State: APjAAAWm0x6UIge7JTXoVvXPtH0vrnN9rEcTMkcSihkcNLpzoDPQVz7H
	Js7fvOMTdBtTOKYrPaOmdJPN+m5fvzc2zw==
X-Google-Smtp-Source: APXvYqx/6huWfwRLf5ViffSI/342M4ee0vogt5YOFuWdz2nnqyvXp9KRLQVtAVy+b//kMxOkdYEMLg==
X-Received: by 2002:a7b:c40c:: with SMTP id k12mr6773053wmi.122.1560348377771; 
	Wed, 12 Jun 2019 07:06:17 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	j3sm18765274wrt.73.2019.06.12.07.06.16
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Jun 2019 07:06:17 -0700 (PDT)
Date: Wed, 12 Jun 2019 16:06:15 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190612140615.GX5803@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <8ceba717-542f-5898-d5d4-890945a022fb@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ceba717-542f-5898-d5d4-890945a022fb@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Drbd-dev] integer overflow in dagtag_newer_eq(0, 1ULL<<63)
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

On Wed, Jun 05, 2019 at 10:01:27AM -0600, David Butterfield wrote:
> drbd_sender.c:maybe_send_unplug_remote() can assign (1ULL << 63) to unplug_dagtag_sector[i]:
> 
> 1674                 connection->todo.unplug_dagtag_sector[connection->todo.unplug_slot] =
> 1675                         connection->send.current_dagtag_sector + (1ULL << 63);
> 
> Later it reaches dagtag_newer_eq(0, unplug_dagtag_sector[i]) which converts its arguments to
> signed before subtracting.
> 
> 272 #define dagtag_newer_eq(a,b)      \
> 273         (typecheck(u64, a) && \
> 274          typecheck(u64, b) && \
> 275         ((s64)(a) - (s64)(b) >= 0))
> 
> But (signed)(1ULL << 63) is the maximum negative integer, and the value of
> (0 - (signed)(1ULL << 63)) cannot be represented.  So the subtraction ends in integer overflow.
> 
> drbd_sender.c:1660:9: runtime error: signed integer overflow: 0 - -9223372036854775808 cannot be represented in type 'long i

I don't care ;-)
but we can add in a -1, if it makes the world a better place


    Lars

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
