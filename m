Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E71C6EC61D
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Apr 2023 08:20:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 70312420546;
	Mon, 24 Apr 2023 08:20:38 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C45144202F5
	for <drbd-dev@lists.linbit.com>; Mon, 24 Apr 2023 04:36:31 +0200 (CEST)
Received: by mail-pf1-f181.google.com with SMTP id
	d2e1a72fcca58-63b4e5fdb1eso4965573b3a.1
	for <drbd-dev@lists.linbit.com>; Sun, 23 Apr 2023 19:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chromium.org; s=google; t=1682303790; x=1684895790;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=Er9IodKAhu5Xy/24MmuM3ISnj8SFsqKhcDcV85YYtd4=;
	b=Myis4J2Z9lmx+G/UGHQV666UFM6OJ8EKtdAre2rvRUUjU2E+rQLKwJ+D0eYgmT72Z9
	5SaX6H/C77vylvdgFXO4tn7m7ArVvZvZSOxiW6NiLDX5h8w4cEfp1YoxEuHlyRXPz09e
	5JgUmEmUJwM1H8XEmuezqPmJ+lzP8zXU2UJcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1682303790; x=1684895790;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Er9IodKAhu5Xy/24MmuM3ISnj8SFsqKhcDcV85YYtd4=;
	b=AhJFBUIKn3OWZ2479NsRDIp2FviwTz09rKRjgTenC51A8Pm4uswuUGm5l74AfTVdFn
	7t+YfRCdLvyJipoTDzDfAhaczXY067TqTqDVBERcQpA0y9l9H6hDzg8wfEWHxqqOOkPw
	YTXk167LAbpb0ZkMgcT0nvFe4pWt5fTkQqDOG5PCkvTG9H99Ke96qYvgIIbdbbrzXR1A
	VAecbTVsCOJiZnaz6B4uHV5NGHR28PC9i7I+v5w6Jz3/6Ys+27UZaFykbv2C0sj7Vabb
	RN5Eb673hdFv2W3cspp32426P3uCFXUxl7CFrlnw8p3cPIlPDBCs91nHOdcCGjmhy3VN
	SF4w==
X-Gm-Message-State: AAQBX9dQKuxCpAKfgrd1fAD7LfjUk2cc1n5b4TRxIf3WydniC/81NTLd
	VL+KSMbK40xNLM6/a/8T+jO1kw==
X-Google-Smtp-Source: AKy350a438RODTsIQbvbOZb4mhoGqhZ1pvzPivBPJ5Ra5hjJQnsR6/IRQqkIVQmM+kaUu2d3rd1IMA==
X-Received: by 2002:a05:6a00:2406:b0:63d:38aa:5617 with SMTP id
	z6-20020a056a00240600b0063d38aa5617mr12656579pfh.6.1682303790512;
	Sun, 23 Apr 2023 19:36:30 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
	by smtp.gmail.com with ESMTPSA id
	h8-20020aa786c8000000b0063b8279d3aasm6183422pfo.159.2023.04.23.19.36.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Apr 2023 19:36:29 -0700 (PDT)
Date: Mon, 24 Apr 2023 11:36:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <20230424023623.GC1496740@google.com>
References: <20230421195807.2804512-1-mcgrof@kernel.org>
	<20230421195807.2804512-6-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230421195807.2804512-6-mcgrof@kernel.org>
X-Mailman-Approved-At: Mon, 24 Apr 2023 08:20:37 +0200
Cc: djwong@kernel.org, philipp.reisner@linbit.com, linux-mm@kvack.org,
	dm-devel@redhat.com, agk@redhat.com, drbd-dev@lists.linbit.com,
	willy@infradead.org, hch@infradead.org, p.raghav@samsung.com,
	senozhatsky@chromium.org, snitzer@kernel.org,
	linux-block@vger.kernel.org, hare@suse.de, kbusch@kernel.org,
	axboe@kernel.dk, da.gomez@samsung.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	minchan@kernel.org, patches@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [PATCH 5/5] zram: use generic PAGE_SECTORS and
	PAGE_SECTORS_SHIFT
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

On (23/04/21 12:58), Luis Chamberlain wrote:
> 
> Instead of re-defining the already existing constants use the provided ones:
> 
> So replace:
> 
>  o SECTORS_PER_PAGE_SHIFT with PAGE_SECTORS_SHIFT
>  o SECTORS_PER_PAGE       with PAGE_SECTORS
> 
> This produces no functional changes.
> 
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
